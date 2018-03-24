#ifndef LOCALPHOTOLIST_H
#define LOCALPHOTOLIST_H

#include <QObject>

#include "photo.h"
#include "photolist.h"

class LocalPhotoList : public PhotoList
{
    Q_OBJECT

    Q_PROPERTY(bool local READ isLocal NOTIFY localStatusChanged)

public:
    LocalPhotoList(QObject *parent = 0);

    bool isLocal();

signals:
    void photoParsed(Photo *photo);
    void allPhotosParsed();
    void reachEnd();

    void localStatusChanged(bool local);

public slots:
    void fetch();
    void nextPage();

private:
    int page = 1;
    int perPage = 10;
};

#endif // LOCALPHOTOLIST_H
