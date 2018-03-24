#ifndef PHOTO_H
#define PHOTO_H

#include <QJsonObject>
#include <QNetworkReply>
#include <QObject>
#include <QUrl>

#ifdef Q_OS_LINUX
#include <QProcess>
#endif

class Photo : public QObject
{
    Q_OBJECT

    Q_PROPERTY(QString id READ getId WRITE setId NOTIFY idChanged)

    Q_PROPERTY(int width READ getWidth WRITE setWidth NOTIFY widthChanged)
    Q_PROPERTY(int height READ getHeight WRITE setHeight NOTIFY heightChanged)

    Q_PROPERTY(QUrl rawUrl READ getRawUrl WRITE setRawUrl NOTIFY rawUrlChanged)
    Q_PROPERTY(QUrl fullUrl READ getFullUrl WRITE setFullUrl NOTIFY fullUrlChanged)
    Q_PROPERTY(QUrl regularUrl READ getRegularUrl WRITE setRegularUrl NOTIFY regularUrlChanged)
    Q_PROPERTY(QUrl smallUrl READ getSmallUrl WRITE setSmallUrl NOTIFY smallUrlChanged)
    Q_PROPERTY(QUrl thumbUrl READ getThumbUrl WRITE setThumbUrl NOTIFY thumbUrlChanged)

    Q_PROPERTY(QUrl apiUrl READ getApiUrl WRITE setApiUrl NOTIFY apiUrlChanged)
    Q_PROPERTY(QUrl pageUrl READ getPageUrl WRITE setPageUrl NOTIFY pageUrlChanged)
    Q_PROPERTY(QUrl downloadUrl READ getDownloadUrl WRITE setDownloadUrl NOTIFY downloadUrlChanged)

    Q_PROPERTY(QString userFullName READ getUserFullName WRITE setUserFullName NOTIFY userFullNameChanged)

    Q_PROPERTY(bool local READ isLocal NOTIFY localStatusChanged)

    Q_PROPERTY(QJsonObject json READ getJson NOTIFY jsonChanged)

public:
    explicit Photo(QObject *parent = 0);
    explicit Photo(QJsonObject json, QObject *parent = 0);

    QString getId();
    int getWidth();
    int getHeight();
    QUrl getRawUrl();
    QUrl getFullUrl();
    QUrl getRegularUrl();
    QUrl getSmallUrl();
    QUrl getThumbUrl();
    QUrl getApiUrl();
    QUrl getPageUrl();
    QUrl getDownloadUrl();
    QString getUserFullName();
    QJsonObject getJson();

    QString getSaveFileName();
    QString getJsonFileName();
    QString getWallpaperPath();
    QString getWallpaperContentsPath();
    QString getWallpaperImagesPath();
    QString getWallpaperImageFileName(int width, int height);
    QString getWallpaperMetadataFileName();
    QString getWallpaperScreenshotFileName();

    bool isLocal();


    void setId(QString id);
    void setWidth(int width);
    void setHeight(int height);
    void setRawUrl(QUrl rawUrl);
    void setFullUrl(QUrl fullUrl);
    void setRegularUrl(QUrl regularUrl);
    void setSmallUrl(QUrl smallUrl);
    void setThumbUrl(QUrl thumbUrl);
    void setApiUrl(QUrl apiUrl);
    void setPageUrl(QUrl pageUrl);
    void setDownloadUrl(QUrl downloadUrl);
    void setUserFullName(QString userFullName);

signals:
    void idChanged(QString id);

    void widthChanged(int width);
    void heightChanged(int height);

    void rawUrlChanged(QUrl rawUrl);
    void fullUrlChanged(QUrl fullUrl);
    void regularUrlChanged(QUrl regularUrl);
    void smallUrlChanged(QUrl smallUrl);
    void thumbUrlChanged(QUrl thumbUrl);

    void apiUrlChanged(QUrl apiUrl);
    void pageUrlChanged(QUrl pageUrl);
    void downloadUrlChanged(QUrl downloadUrl);

    void userFullNameChanged(QString userFullName);

    void jsonChanged(QJsonObject json);

    void localStatusChanged(bool local);

    void downloadFailed();
    void downloaded();
    void downloadProgress(qint64 bytesRead, qint64 totalBytes);
    void saveProgress(int filesSaved, int totalFiles);
    void saved();

public slots:
    void save();
    void download();
    void remove();
    void setWallpaper();

private:
    QString id;
    int width;
    int height;
    QUrl rawUrl;
    QUrl fullUrl;
    QUrl regularUrl;
    QUrl smallUrl;
    QUrl thumbUrl;
    QUrl apiUrl;
    QUrl pageUrl;
    QUrl downloadUrl;
    QString userFullName;
    QJsonObject json;

    QNetworkReply *reply;

#ifdef Q_OS_LINUX
    QProcess process;
    void generateWallpaperImage(int width, int height, QString path = QString(""));
#endif // Q_OS_LINUX
};

#endif // PHOTO_H
