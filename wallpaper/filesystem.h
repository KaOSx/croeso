#ifndef FILESYSTEM_H
#define FILESYSTEM_H

#include <QObject>

class FileSystem : public QObject
{
    Q_OBJECT
public:
    explicit FileSystem(QObject *parent = 0);

    static void init();

    static QString getWallpaperPath();
    static QString getSavePath();
    static QString getAppDataPath();
    static QStringList getAppDataPaths();
    static QStringList getTranslationPaths();
    static QString getAppConfigPath();

signals:

public slots:
};

#endif // FILESYSTEM_H
