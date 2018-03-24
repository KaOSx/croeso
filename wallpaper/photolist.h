#ifndef PHOTOLIST_H
#define PHOTOLIST_H

#include <QObject>
#include <QNetworkReply>

#include "unsplash.h"
#include "photo.h"

class PhotoList : public QObject
{
    Q_OBJECT

    Q_ENUMS(Order)

    Q_PROPERTY(Order order READ getOrder WRITE setOrder NOTIFY orderChanged)
    Q_PROPERTY(bool curated READ isCurated WRITE setCuratedStatus NOTIFY curatedStatusChanged)
    Q_PROPERTY(bool local READ isLocal NOTIFY localStatusChanged)

public:
    explicit PhotoList(QObject *parent = 0);

    enum Order { Latest, Oldest, Popular };

    Order getOrder();
    bool isCurated();
    bool isLocal();

    void setOrder(Order order);
    void setCuratedStatus(bool curated);

signals:
    void downloadProgress(qint64 bytesRead, qint64 totalBytes);
    void photoParsed(Photo *photo);
    void allPhotosParsed();
    void reachEnd();

    void orderChanged(Order order);
    void curatedStatusChanged(bool curated);
    void localStatusChanged(bool local);

public slots:
    void parsePhotos();
    void fetch();
    void nextPage();

private:
    Unsplash unsplash;
    QNetworkReply* reply;
    Order order = Order::Latest;
    bool curated = false;
    int page = 1;
    int perPage = 10;
};

#endif // PHOTOLIST_H
