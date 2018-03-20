#include <QGuiApplication>
#include <QQmlApplicationEngine>

#include <QTranslator>
#include <QLocale>
#include <QQuickStyle>

#include <QtWebView/QtWebView>

int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
    QGuiApplication app(argc, argv);
    
    QtWebView::initialize();

    QQuickStyle::setStyle("Material");

    QTranslator appTranslator;

    appTranslator.load(":/lang/croeso_" +
                       QLocale::system().name());
    app.installTranslator(&appTranslator);

    QQmlApplicationEngine engine;
    engine.load(QUrl(QLatin1String("qrc:/main.qml")));
    if (engine.rootObjects().isEmpty())
        return -1;

    return app.exec();
}
