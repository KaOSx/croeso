QT += qml quick quickcontrols2 webview

TEMPLATE = app

CONFIG += c++17
unix: CONFIG += link_pkgconfig
unix: PKGCONFIG += Magick++

SOURCES += main.cpp \
    wallpaper/unsplash.cpp \
    wallpaper/photo.cpp \
    wallpaper/photolist.cpp \
    wallpaper/photosavethread.cpp \
    wallpaper/filesystem.cpp \
    wallpaper/localphotolist.cpp

RESOURCES += qml.qrc

QMAKE_LFLAGS += -fuse-ld=gold

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

# Additional import path used to resolve QML modules just for Qt Quick Designer
QML_DESIGNER_IMPORT_PATH =

# The following define makes your compiler emit warnings if you use
# any feature of Qt which as been marked deprecated (the exact warnings
# depend on your compiler). Please consult the documentation of the
# deprecated API in order to know how to port your code away from it.
DEFINES += QT_DEPRECATED_WARNINGS

# You can also make your code fail to compile if you use deprecated APIs.
# In order to do so, uncomment the following line.
# You can also select to disable deprecated APIs only up to a certain version of Qt.
#DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0x060000    # disables all the APIs deprecated before Qt 6.0.0

TRANSLATIONS  += lang/croeso.ts \
              lang/croeso_nl_NL.ts \
              lang/croeso_ast.ts \
              lang/croeso_bg.ts \
              lang/croeso_ca.ts \
              lang/croeso_cs.ts \
              lang/croeso_da.ts \
              lang/croeso_de.ts \
              lang/croeso_es.ts \
              lang/croeso_es_AR.ts \
              lang/croeso_fa_IR.ts \
              lang/croeso_fr.ts \
              lang/croeso_fi.ts \
              lang/croeso_hi_IN.ts \
              lang/croeso_hr_HR.ts \
              lang/croeso_hu.ts \
              lang/croeso_id_ID.ts \
              lang/croeso_it.ts \
              lang/croeso_ja.ts \
              lang/croeso_pl.ts \
              lang/croeso_pt_BR.ts \
              lang/croeso_ru.ts \
              lang/croeso_si.ts \
              lang/croeso_uk.ts \
              lang/croeso_tr_TR.ts \

# Default rules for deployment.
#qnx: target.path = /tmp/$${TARGET}/bin
#else: unix:!android: target.path = /opt/$${TARGET}/bin
#!isEmpty(target.path): INSTALLS += target
target.path = /usr/bin
sources.files = $$SOURCES $$RESOURCES *.pro
sources.path = .

desktop.path = /usr/share/applications
desktop.files += croeso.desktop

icon.files += croeso.svg
icon.path += /usr/share/icons/hicolor/48x48/apps

qml.path = /usr/lib/qt6/qml/croeso
#qml.files += package.qml

INSTALLS += target desktop icon qml

DISTFILES +=

HEADERS += \
    wallpaper/unsplash.h \
    wallpaper/photo.h \
    wallpaper/photolist.h \
    wallpaper/photosavethread.h \
    wallpaper/filesystem.h \
    wallpaper/localphotolist.h
