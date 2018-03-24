#ifndef PHOTOSAVETHREAD_H
#define PHOTOSAVETHREAD_H

#include <QThread>

#include "photo.h"

class PhotoSaveThread : public QThread
{
    Q_OBJECT

public:
    PhotoSaveThread(Photo *photo, QObject *parent = 0);
    ~PhotoSaveThread();

    void save();

signals:
    void saved();

protected:
    void run() override;

private:
    Photo *photo;
};

#endif // PHOTOSAVETHREAD_H
