#ifndef BREWERY_H
#define BREWERY_H

#include <QObject>
#include "kettle.h"

class Brewery : public QObject
{
    Q_OBJECT
    //Q_PROPERTY(double hltTemp READ getHltTemp WRITE setHltTemp NOTIFY hltTempChanged)
public:
    explicit Brewery(QObject *parent = 0);
    //void setHltTemp(double temp);
    //double getHltTemp();
signals:
    void hltTempChanged();
public slots:
    void setHltTemp(double temp);
    double getHltTemp();
private:
    //double m_hltTemp;
    Kettle hotLiquorTank;
    Kettle mashLiquorTank;
    Kettle boilLiquorTank;
};

/*// Second, define the singleton type provider function (callback).
static QObject *brewerySingleton(QQmlEngine *engine, QJSEngine *scriptEngine)
{
    Q_UNUSED(engine)
    Q_UNUSED(scriptEngine)

    Brewery *brewery = new Brewery();
    return brewery;
}

// Third, register the singleton type provider with QML by calling this function in an initialization function.
qmlRegisterSingletonType<Brewery>("BrewMasterQuick.mybrewery", 1, 0, "MyBrewery", brewerySingleton);
*/
#endif // BREWERY_H
