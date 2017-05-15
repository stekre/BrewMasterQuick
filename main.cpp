#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include "ViewManager/mainviewmgr.h"
#include "textfielddoublevalidator.h"
#include "brewery.h"

int main(int argc, char *argv[])
{                
    qputenv("QT_IM_MODULE", QByteArray("qtvirtualkeyboard"));

    QGuiApplication app(argc, argv);

    qmlRegisterType<TextFieldDoubleValidator>("TextFieldDoubleValidator", 1,0,
                                              "TextFieldDoubleValidator");

    QQmlApplicationEngine engine;

    MainViewMgr mainViewMgr;
    auto ctx = engine.rootContext();
    ctx->setContextProperty("MainViewMgr", &mainViewMgr);

    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));

    return app.exec();
}
