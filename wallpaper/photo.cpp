#include <QDir>
#include <QFile>
#include <QJsonDocument>
#include <QNetworkAccessManager>
#include <QNetworkReply>
#include <QNetworkRequest>
#include "filesystem.h"
#include "photosavethread.h"

#include "photo.h"

#ifdef Q_OS_LINUX
#include <QProcess>
#include <Magick++.h>
using namespace Magick;
#endif

Photo::Photo(QObject *parent) : QObject(parent)
{

}

Photo::Photo(QJsonObject json, QObject *parent) : QObject(parent)
{
    this->json = json;

    id = json["id"].toString();

    width = json["width"].toInt();
    height = json["height"].toInt();

    QJsonObject urls = json["urls"].toObject();
    rawUrl = QUrl(urls["raw"].toString());
    fullUrl = QUrl(urls["full"].toString());
    regularUrl = QUrl(urls["regular"].toString());
    smallUrl = QUrl(urls["small"].toString());
    thumbUrl = QUrl(urls["thumb"].toString());

    QJsonObject links = json["links"].toObject();
    apiUrl = QUrl(links["self"].toString());
    pageUrl = QUrl(links["html"].toString());
    downloadUrl = QUrl(links["download"].toString());

    QJsonObject user = json["user"].toObject();
    userFullName = user["name"].toString();
}

void Photo::download()
{
    QNetworkAccessManager *network = new QNetworkAccessManager;
    reply = network->get(QNetworkRequest(fullUrl));

    PhotoSaveThread *thread = new PhotoSaveThread(this);
    connect(reply, &QNetworkReply::downloadProgress, this, &Photo::downloadProgress);
    connect(reply, &QNetworkReply::finished, this, &Photo::downloaded);
    connect(reply, &QNetworkReply::finished, thread, &PhotoSaveThread::save);
    //connect(reply, static_cast<void(QNetworkReply::*)(QNetworkReply::NetworkError)>(&QNetworkReply::error), this, &Photo::downloadFailed);

    connect(thread, &PhotoSaveThread::saved, this, &Photo::saved);
}

void Photo::save()
{
    // Save photo in full size
    QFile *file = new QFile;
    file->setFileName(getSaveFileName());
    file->open(QIODevice::ReadWrite); // Create file if not exists
    file->write(reply->readAll());
    emit saveProgress(1, 10);

    // Save JSON
    QFile jsonFile(getJsonFileName());

    if (jsonFile.open(QIODevice::ReadWrite)) {
        QJsonDocument doc(json);
        QTextStream stream(&jsonFile);
        stream << doc.toJson(QJsonDocument::Compact) << Qt::endl;
        stream << Qt::endl;
    }

    emit saveProgress(2, 10);

    QDir *dir = new QDir;
    dir->mkpath(getWallpaperImagesPath()); // Create directory if not exists
    generateWallpaperImage(3840, 2160); // 4K/UHD, popular desktop monitor resolution
    emit saveProgress(3, 10);
    generateWallpaperImage(2560, 1440); // 2K/QHD, popular desktop monitor resolution
    emit saveProgress(4, 10);
    generateWallpaperImage(1920, 1080); // FHD, most popular desktop and gaming laptop screen resolution
    emit saveProgress(5, 10);
    generateWallpaperImage(1366, 768); // HD, most popular laptop screen resolution
    emit saveProgress(6, 10);
    generateWallpaperImage(1280, 1024); // Legacy desktop monitor resolution
    emit saveProgress(7, 10);
    generateWallpaperImage(1024, 768); // Legacy laptop screen resolution
    emit saveProgress(8, 10);
    generateWallpaperImage(400, 250, getWallpaperScreenshotFileName()); // Screenshot used in desktop configuration
    emit saveProgress(9, 10);

    QFile metafile(getWallpaperMetadataFileName());

    if (metafile.open(QIODevice::ReadWrite)) {
        QTextStream stream(&metafile);
        stream << "[Desktop Entry]" << Qt::endl;
        stream << "Encoding=UTF-8" << Qt::endl;
        stream << "Name=Unsplash " << id << Qt::endl;
        stream << "X-KDE-PluginInfo-Name=Unsplash " << id << Qt::endl;
        stream << "X-KDE-PluginInfo-Author=" << userFullName << Qt::endl;
        stream << "X-KDE-PluginInfo-License=CC0" << Qt::endl;
        stream << "X-KDE-PluginInfo-Website=https://unsplash.com/" << Qt::endl;
        stream << Qt::endl;
    }

    emit saveProgress(10, 10);

    emit saved();

    emit localStatusChanged(true);
}

void Photo::generateWallpaperImage(int width, int height, QString path)
{
    int resizeWidth;
    int resizeHeight;

    if (width * this->height  > this->width * height) {
        resizeWidth = width;
        resizeHeight = (int) (resizeWidth * this->height * 1.0 / this->width + 0.5); // Round up
    } else {
        resizeHeight = height;
        resizeWidth = (int) (resizeHeight * this->width * 1.0 / this->height + 0.5); // Round up
    }

    QFile *file = new QFile;
    file->setFileName(getWallpaperImageFileName(width, height));
    file->open(QIODevice::ReadWrite); // Create file if not exists

    Image image;

    try {
        // Read full size photo
        image.read(getSaveFileName().toUtf8().constData());

        image.resize(Geometry(resizeWidth, resizeHeight));

        image.crop(Geometry(width, height, (resizeWidth - width) / 2, (resizeHeight - height) / 2));

        if (path.isNull() || path.isEmpty()) {
            image.write(getWallpaperImageFileName(width, height).toUtf8().constData());
        } else {
            image.write(path.toUtf8().constData());
        }
    } catch ( Exception &error ) {
        qDebug() << "Caught exception: " << error.what();
        return;
    }
}

void Photo::remove()
{
    // Remove wallpaper directory
    QDir dir(getWallpaperPath());
    dir.removeRecursively();

    // Remove JSON
    QFile jsonFile(getJsonFileName());
    jsonFile.remove();

    // Remove photo
    QFile file(getSaveFileName());
    file.remove();

    emit localStatusChanged(false);
}

QString Photo::getId()
{
    return id;
}

int Photo::getWidth()
{
    return width;
}

int Photo::getHeight()
{
    return height;
}

QUrl Photo::getRawUrl()
{
    return rawUrl;
}

QUrl Photo::getFullUrl()
{
    return fullUrl;
}

QUrl Photo::getRegularUrl()
{
    return regularUrl;
}

QUrl Photo::getSmallUrl()
{
    return smallUrl;
}

QUrl Photo::getThumbUrl()
{
    return thumbUrl;
}

QUrl Photo::getApiUrl()
{
    return apiUrl;
}

QUrl Photo::getPageUrl()
{
    return pageUrl;
}

QUrl Photo::getDownloadUrl()
{
    return downloadUrl;
}

QString Photo::getUserFullName()
{
    return userFullName;
}

QJsonObject Photo::getJson()
{
    return json;
}

/**
 * @brief Path of saved full size photo
 * Usually it is /home/<username>/Pictures/Unwallpaper/<photoId>.jpg
 * @return
 */
QString Photo::getSaveFileName()
{
    return FileSystem::getSavePath() + QString("/") + id + QString(".jpg");
}

/**
 * @brief Path of saved JSON object
 * Usually it is /home/<username>/.local/share/unwallpaper/data/photos/<photoId>.json
 * @return
 */
QString Photo::getJsonFileName()
{
    return FileSystem::getAppDataPath() + QString("/data/photos/") + id + QString(".json");
}

QString Photo::getWallpaperPath ()
{
    return FileSystem::getWallpaperPath() + QString("/Unwallpaper-") + id;
}

QString Photo::getWallpaperContentsPath ()
{
    return getWallpaperPath() + QString("/contents");
}

QString Photo::getWallpaperImagesPath ()
{
    return getWallpaperContentsPath() + QString("/images");
}

QString Photo::getWallpaperImageFileName(int width, int height)
{
    return getWallpaperImagesPath() + QString("/") + QString::number(width) + QString("x") + QString::number(height) + QString(".jpg");
}

QString Photo::getWallpaperMetadataFileName()
{
    return getWallpaperPath() + QString("/metadata.desktop");
}

QString Photo::getWallpaperScreenshotFileName()
{
    return getWallpaperContentsPath() + QString("/screenshot.jpg");
}

bool Photo::isLocal()
{
    QFile file(getSaveFileName());
    QFile json(getJsonFileName());
    return file.exists() && json.exists();
}

void Photo::setId(QString id)
{
    this->id = id;
    emit idChanged(id);
}

void Photo::setWidth(int width)
{
    this->width = width;
    emit widthChanged(width);
}

void Photo::setHeight(int height)
{
    this->height = height;
    emit heightChanged(height);
}

void Photo::setRawUrl(QUrl rawUrl)
{
    this->rawUrl = rawUrl;
    emit rawUrlChanged(rawUrl);
}

void Photo::setFullUrl(QUrl fullUrl)
{
    this->fullUrl = fullUrl;
    emit fullUrlChanged(fullUrl);
}

void Photo::setRegularUrl(QUrl regularUrl)
{
    this->regularUrl = regularUrl;
    emit regularUrlChanged(regularUrl);
}

void Photo::setSmallUrl(QUrl smallUrl)
{
    this->smallUrl = smallUrl;
    emit smallUrlChanged(smallUrl);
}

void Photo::setThumbUrl(QUrl thumbUrl)
{
    this->thumbUrl = thumbUrl;
    emit thumbUrlChanged(thumbUrl);
}

void Photo::setApiUrl(QUrl apiUrl)
{
    this->apiUrl = apiUrl;
    emit apiUrlChanged(apiUrl);
}

void Photo::setPageUrl(QUrl pageUrl)
{
    this->pageUrl = pageUrl;
    emit pageUrlChanged(pageUrl);
}

void Photo::setDownloadUrl(QUrl downloadUrl)
{
    this->downloadUrl = downloadUrl;
    emit downloadUrlChanged(downloadUrl);
}

void Photo::setUserFullName(QString userFullName)
{
    this->userFullName = userFullName;
    emit userFullNameChanged(userFullName);
}

void Photo::setWallpaper()
{
    // KDE
    // NOTE: KDE 5 API is still changing, it may not work on all KDE versions
    QString script;
    script += "var allDesktops=desktops();";
    script += "for(var i=0;i<allDesktops.length;i++){";
    script += "  var d=allDesktops[i];";
    script += "  d.wallpaperPlugin=\"org.kde.image\";";
    script += "  d.currentConfigGroup=Array(\"Wallpaper\",\"org.kde.image\",\"General\");";
    script += "  d.writeConfig(\"Image\",\"file://";
    script += getSaveFileName();
    script += "\");";
    script += "}";
    QStringList args;
    args << "org.kde.plasmashell"
         << "/PlasmaShell"
         << "org.kde.PlasmaShell.evaluateScript"
         << script;
    process.start(QString("qdbus-qt6"), args);
    process.waitForFinished();
}
