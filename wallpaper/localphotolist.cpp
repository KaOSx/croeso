#include <QDebug>
#include <QDir>
#include <QFile>
#include <QJsonDocument>
#include <QJsonObject>

#include "filesystem.h"

#include "localphotolist.h"

LocalPhotoList::LocalPhotoList(QObject* parent) : PhotoList(parent)
{

}

void LocalPhotoList::fetch()
{
    QDir dir(FileSystem::getAppDataPath() + QString("/data/photos"));
    QStringList filters;
    filters << "*.json";
    dir.setNameFilters(filters);
    dir.setFilter(QDir::Files);
    dir.setSorting(QDir::Time | QDir::Reversed);

    foreach (QString filename, dir.entryList()) {
        QFile file(dir.absoluteFilePath(filename));
        file.open(QIODevice::ReadOnly | QIODevice::Text);
        QString string = file.readAll();
        QJsonDocument doc = QJsonDocument::fromJson(string.toUtf8());
        QJsonObject json = doc.object();
        Photo *photo = new Photo(json);

        emit photoParsed(photo);
    }

    emit allPhotosParsed();
    emit reachEnd();
}

void LocalPhotoList::nextPage()
{
    page++;
    fetch();
}

bool LocalPhotoList::isLocal()
{
    return true;
}
