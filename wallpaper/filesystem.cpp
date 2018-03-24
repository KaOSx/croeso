#include <QDir>
#include <QStandardPaths>

#include "filesystem.h"

FileSystem::FileSystem(QObject *parent) : QObject(parent)
{

}

/**
 * @brief Create missing files and directories required by application
 */
void FileSystem::init()
{
    QDir *dir = new QDir;

    dir->mkpath(getWallpaperPath());
    dir->mkpath(getSavePath());
    dir->mkpath(getAppDataPath());
    dir->mkpath(getAppDataPath() + QString("/data/photos"));
    dir->mkpath(getAppDataPath() + QString("/data/collections"));
    dir->mkpath(getAppDataPath() + QString("/data/users"));
    dir->mkpath(getAppConfigPath());
}

/**
 * @brief Path of linux wallpaper folder, storing images of popular screen sizes (only for Linux)
 * Usually it is /home/<username>/.local/share/wallpapers
 * @return
 */
QString FileSystem::getWallpaperPath()
{
    return QStandardPaths::writableLocation(QStandardPaths::GenericDataLocation) + QString("/wallpapers");
}

/**
 * @brief Path of Unwallpaper folder, storing full size photos
 * Usually it is Pictures/Unwallpaper under user home
 * @return
 */
QString FileSystem::getSavePath()
{
    return QStandardPaths::writableLocation(QStandardPaths::PicturesLocation) + QString("/Unwallpaper");
}

/**
 * @brief Path of application data folder, storing data that users don't need to know
 * On Linux, it is /home/<username>/.local/share/unwallpaper, FAILING
 * @return
 */
QString FileSystem::getAppDataPath()
{
    return QStandardPaths::writableLocation(QStandardPaths::AppDataLocation);
}

/**
 * @brief Paths of user and system application data folders
 * On Linux, this will return three paths in following order:
 * * /home/<username>/.local/share/unwallpaper
 * * /usr/local/share/unwallpaper
 * * /usr/share/unwallpaper
 * @return
 */
QStringList FileSystem::getAppDataPaths()
{
    return QStandardPaths::standardLocations(QStandardPaths::AppDataLocation);
}

/**
 * @brief Paths of translations folders
 * On Linux, this will return four paths in following order:
 * * <appdir>/translations (if this app was downloaded as tar ball)
 * * /home/<username>/.local/share/unwallpaper/translations
 * * /usr/local/share/unwallpaper/translations
 * * /usr/share/unwallpaper/translations
 * @return
 */
QStringList FileSystem::getTranslationPaths()
{
    QStringList paths;

    paths = QStandardPaths::locateAll(QStandardPaths::AppDataLocation, QString("translations"), QStandardPaths::LocateDirectory);

    paths.prepend(QString("translations"));

    return paths;
}

/**
 * @brief Path of application config folder, storing
 * On Linux, it is /home/<username>/.config/unwallpaper
 * @return
 */
QString FileSystem::getAppConfigPath()
{
    return QStandardPaths::writableLocation(QStandardPaths::AppConfigLocation);
}
