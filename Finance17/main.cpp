#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>

#include "apirest.h"
#include "sqllitedatabase.h"

#include "mainwindow.h"

int main(int argc, char *argv[])
{
    #if QT_VERSION < QT_VERSION_CHECK(6, 0, 0)
        QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
    #endif

    QGuiApplication app(argc, argv);

    app.setApplicationName("Finance17 QML <=> SQL");

    MainWindow mainW;

    QQmlApplicationEngine engine;

    qmlRegisterType<SqlLiteDatabase>("org.mydb", 1, 0, "SqlLiteDatabase");

    qmlRegisterType<ApiRest>("Finance17", 1, 0, "ApiRest" );

    //engine.rootContext()->setContextProperty("appBridge", &apirest);

    const QUrl url("qrc:/qml/main.qml");
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
        &app, [url](QObject *obj, const QUrl &objUrl) {
            if (!obj && url == objUrl)
                QCoreApplication::exit(-1);
        }, Qt::QueuedConnection);
    engine.load(url);

    return app.exec();
}
