#include "mainviewmgr.h"

namespace brewmaster
{
    MainViewMgr::MainViewMgr(QObject *parent) :
        QObject(parent),
        m_brewery(new Brewery(this))
    {

    }

    Brewery *MainViewMgr::brewery() const
    {
        return m_brewery;
    }

    void MainViewMgr::setBrewery(Brewery *brewery)
    {
        if (m_brewery == brewery)
            return;

        m_brewery = brewery;
        emit breweryChanged(brewery);
    }
}
