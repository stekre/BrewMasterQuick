#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include "textfielddoublevalidator.h"
#include "brewery.h"
#include "notification.h"

int main(int argc, char *argv[])
{                
    QGuiApplication app(argc, argv);

    qmlRegisterType<TextFieldDoubleValidator>("TextFieldDoubleValidator", 1,0,
                                              "TextFieldDoubleValidator");

    QQmlApplicationEngine engine;

    Notification notification;
    Brewery brewery;
    QQmlContext* ctx = engine.rootContext();
    ctx->setContextProperty("brewery", &brewery);
    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));

    return app.exec();
}
