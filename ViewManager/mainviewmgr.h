#ifndef MAINVIEWMGR_H
#define MAINVIEWMGR_H

#include <QObject>
#include <QDebug>
#include "brewery.h"

namespace brewmaster
{
    class MainViewMgr : public QObject
    {
        Q_OBJECT
        Q_PROPERTY(QString appName READ appName CONSTANT)
        Q_PROPERTY(Brewery* brewery READ brewery WRITE setBrewery NOTIFY breweryChanged)
    public:
        explicit MainViewMgr(QObject *parent = 0);
        QString appName() const {return m_appName;}
        Brewery* brewery() const;

    signals:
        void breweryChanged(Brewery* brewery);

    public slots:
        void setBrewery(Brewery* brewery);

    private:
        QString m_appName {"BrewMaster Quick"};
        Brewery* m_brewery;
    };
}

#endif // MAINVIEWMGR_H
