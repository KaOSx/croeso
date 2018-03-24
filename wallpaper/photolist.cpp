#include <QDebug>
#include <QJsonDocument>
#include <QJsonArray>
#include <QJsonObject>
#include <QJsonValue>
#include <QString>
#include <QUrlQuery>

#include "photolist.h"

PhotoList::PhotoList(QObject *parent) : QObject(parent)
{

}

void PhotoList::fetch()
{
    QString path;

    if (curated) {
        path = QString("/photos/curated");
    } else {
        path = QString("/photos");
    }

    QUrlQuery query;
    query.addQueryItem("page", QString::number(page));
    query.addQueryItem("per_page", QString::number(perPage));

    switch (order) {
    case Order::Popular:
        query.addQueryItem("order_by", QString("popular"));
        break;
    case Order::Latest:
        query.addQueryItem("order_by", QString("latest"));
        break;
    case Order::Oldest:
        query.addQueryItem("order_by", QString("oldest"));
        break;
    }

    reply = unsplash.get(path, query);

    // Update progress while waiting response data
    connect(reply, &QNetworkReply::downloadProgress, this, &PhotoList::downloadProgress);

    // Response finished and data is ready to read
    connect(reply, &QNetworkReply::finished, this, &PhotoList::parsePhotos);
}

void PhotoList::nextPage()
{
    page++;
    fetch();
}

/**
 * @brief Parse downloaded JSON of a list of photos.
 */
void PhotoList::parsePhotos()
{
    QString stringReply = (QString) reply->readAll();
    QJsonDocument jsonResponse = QJsonDocument::fromJson(stringReply.toUtf8());
    QJsonArray array = jsonResponse.array();

    foreach (const QJsonValue & value, array) {
        QJsonObject object = value.toObject();

        emit photoParsed(new Photo(object));
    }

    emit allPhotosParsed();

    if (array.count() < perPage) {
       emit reachEnd();
    }
}

PhotoList::Order PhotoList::getOrder()
{
    return order;
}

bool PhotoList::isCurated()
{
    return curated;
}

void PhotoList::setOrder(Order order)
{
    this->order = order;

    emit orderChanged(order);
}

void PhotoList::setCuratedStatus(bool curated)
{
    this->curated = curated;

    emit curatedStatusChanged(curated);
}

bool PhotoList::isLocal()
{
    return false;
}
