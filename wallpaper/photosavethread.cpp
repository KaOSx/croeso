#include <QThread>

#include "photo.h"
#include "photosavethread.h"

PhotoSaveThread::PhotoSaveThread(Photo *photo, QObject *parent) : QThread(parent)
{
    this->photo = photo;
}

PhotoSaveThread::~PhotoSaveThread()
{
    wait();
}

void PhotoSaveThread::save()
{
    if (!isRunning()) {
        start(LowPriority);
    }
}

void PhotoSaveThread::run()
{
    photo->save();
    qDebug("Saved!");

    emit saved();
}
