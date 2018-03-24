#ifndef UNSPLASH_H
#define UNSPLASH_H

#include <QJsonArray>
#include <QJsonObject>
#include <QNetworkAccessManager>
#include <QNetworkReply>
#include <QNetworkRequest>
#include <QObject>
#include <QString>
#include <QUrl>
#include <QUrlQuery>

#include "photo.h"

class Unsplash : public QObject
{
    Q_OBJECT
public:
    explicit Unsplash(QObject *parent = 0);

    QUrl makeUrl(QString path, QUrlQuery query);
    QNetworkReply* get(QString path, QUrlQuery query);

signals:

public slots:

private:
    QNetworkAccessManager network;
};

#endif // UNSPLASH_H
