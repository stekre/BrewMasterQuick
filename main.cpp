#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include "ViewManager/mainviewmgr.h"
#include "textfielddoublevalidator.h"
#include "brewery.h"
#include "Model/settings.h"

int main(int argc, char *argv[])
{                
    //qputenv("QML2_IMPORT_PATH", KEYBOARD_STYLE_DIR);
    qputenv("QT_IM_MODULE", QByteArray("qtvirtualkeyboard"));

    QGuiApplication app(argc, argv);

    qmlRegisterType<TextFieldDoubleValidator>("TextFieldDoubleValidator", 1,0,
                                              "TextFieldDoubleValidator");

    Settings applicationSettings;
    applicationSettings.loadSettings();

    QQmlApplicationEngine engine;
    /*  DEBUG IMPORT PATH
    for(QString path : engine.importPathList())
    {
        qDebug(path.toStdString().c_str());
    }*/

    brewmaster::MainViewMgr mainViewMgr;
    auto ctx = engine.rootContext();
    ctx->setContextProperty("MainViewMgr", &mainViewMgr);

    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));

    return app.exec();
}
