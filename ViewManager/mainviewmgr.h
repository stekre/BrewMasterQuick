#ifndef MAINVIEWMGR_H
#define MAINVIEWMGR_H

#include <QObject>
#include <QDebug>
#include "brewery.h"
#include "Model/brewplan.h"

namespace brewmaster
{
    class MainViewMgr : public QObject
    {
        Q_OBJECT
        Q_PROPERTY(QString appName READ appName CONSTANT)
        Q_PROPERTY(Brewery* brewery READ brewery WRITE setBrewery NOTIFY breweryChanged)
        Q_PROPERTY(Brewplan* brewplan READ brewplan WRITE setBrewplan NOTIFY brewplanChanged)

    public:
        explicit MainViewMgr(QObject *parent = 0);
        QString appName() const {return m_appName;}
        Brewery* brewery() const;
        Brewplan* brewplan() const;

    signals:
        void breweryChanged(Brewery* brewery);
        void brewplanChanged(Brewplan* brewplan);

    public slots:
        void setBrewery(Brewery* brewery);
        void setBrewplan(Brewplan* brewplan);

    private:
        QString m_appName {"BrewMaster Quick"};
        Brewery* m_brewery;
        Brewplan* m_brewplan;
    };
}

#endif // MAINVIEWMGR_H
