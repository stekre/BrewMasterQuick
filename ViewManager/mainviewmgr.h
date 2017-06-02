#ifndef MAINVIEWMGR_H
#define MAINVIEWMGR_H

#include <QObject>
//#include <QAbstractListModel>
#include <QDebug>
#include "Model/brewery.h"
#include "Model/brewplan.h"
#include "Model/clock.h"

namespace brewmaster
{
    class MainViewMgr : public QObject
    {
        Q_OBJECT
        Q_PROPERTY(QString appName READ appName CONSTANT)
        Q_PROPERTY(Brewery* brewery READ brewery WRITE setBrewery NOTIFY breweryChanged)
        Q_PROPERTY(Brewplan* brewplan READ brewplan WRITE setBrewplan NOTIFY brewplanChanged)
        Q_PROPERTY(Clock* clock READ clock NOTIFY clockChanged)

    public:
        MainViewMgr(QObject *parent = 0);
        QString appName() const {return m_appName;}
        Brewery* brewery() const;
        Brewplan* brewplan() const;

        //int rowCount(const QModelIndex & parent = QModelIndex()) const;
        //QVariant data(const QModelIndex & index, int role) const;

        Clock* clock() const;

    signals:
        void breweryChanged(Brewery* brewery);
        void brewplanChanged(Brewplan* brewplan);        
        void clockChanged(Clock* clock);

    public slots:
        void setBrewery(Brewery* brewery);
        void setBrewplan(Brewplan* brewplan);

    protected:
        //QHash<int, QByteArray> roleNames() const;

    private:
        QString m_appName {"BrewMaster Quick"};
        Brewery* m_brewery;
        Brewplan* m_brewplan;
        Clock* m_clock;
    };
}

#endif // MAINVIEWMGR_H
