#include "mainviewmgr.h"

namespace brewmaster
{
    MainViewMgr::MainViewMgr(QObject *parent) :
        QObject(parent),
        m_brewery(new Brewery(this)),
        m_brewplan(new Brewplan(this)),
        m_clock(new Clock(this))
    {
        //m_brewplan.mashplan.append(new Brewplan(50,25));
    }

    Brewery *MainViewMgr::brewery() const
    {
        return m_brewery;
    }

    Brewplan *MainViewMgr::brewplan() const
    {
        return m_brewplan;
    }

    Clock *MainViewMgr::clock() const
    {
        return m_clock;
    }

    void MainViewMgr::setBrewery(Brewery *brewery)
    {
        if (m_brewery == brewery)
            return;

        m_brewery = brewery;
        emit breweryChanged(brewery);
    }

    void MainViewMgr::setBrewplan(Brewplan *brewplan)
    {
        if (m_brewplan == brewplan)
            return;

        m_brewplan = brewplan;
        emit brewplanChanged(brewplan);
    }

    /*int MainViewMgr::rowCount(const QModelIndex & parent) const
    {
        Q_UNUSED(parent);
        return 0;
    }

    QVariant MainViewMgr::data(const QModelIndex & index, int role) const
    {
        Q_UNUSED(index)
        return 0;
    }

    QHash<int, QByteArray> MainViewMgr::roleNames() const
    {
        QHash<int, QByteArray> roles;
        //roles[TypeRole] = "type";
        //roles[SizeRole] = "size";
        return roles;
    }*/
}
