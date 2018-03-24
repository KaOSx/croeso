#include <QDebug>
#include <QNetworkAccessManager>
#include <QNetworkReply>
#include <QNetworkRequest>
#include <QObject>
#include <QString>
#include <QUrl>
#include <QUrlQuery>

#include "unsplash.h"

#define APP_ID "ff62b721ff7e37849733e4ef88b2330026e397dd858a0ecd9bd1fea124b7621d"

/**
 * @brief Unsplash::Unsplash
 * @param parent
 */
Unsplash::Unsplash(QObject *parent) : QObject(parent)
{
}

/**
 * @brief Unsplash::makeUrl
 * @param QString path
 * @param QurlQuery query
 * @return QUrl
 */
QUrl Unsplash::makeUrl(QString path, QUrlQuery query)
{
    QUrl url;
    url.setScheme("https");
    url.setHost("api.unsplash.com");
    url.setPath(path);
    query.addQueryItem(QString("client_id"), QString(APP_ID));
    url.setQuery(query);

    return url;
}

/**
 * @brief Unsplash::get
 * @param path
 * @param query
 * @return
 */
QNetworkReply* Unsplash::get(QString path, QUrlQuery query)
{
    QUrl url = makeUrl(path, query);
    return network.get(QNetworkRequest(url));
}

