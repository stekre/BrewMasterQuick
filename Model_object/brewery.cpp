#include "Model/brewery.h"

namespace brewmaster
{
    Brewery::Brewery(QObject *parent) :
        QObject(parent),
        m_hlt(new Kettle(this)),
        m_mlt(new Kettle(this)),
        m_blt(new Kettle(this))
    {
    }

    Kettle *Brewery::hlt() const
    {
        return m_hlt;
    }

    Kettle *Brewery::mlt() const
    {
        return m_mlt;
    }

    Kettle *Brewery::blt() const
    {
        return m_blt;
    }

    void Brewery::setHlt(Kettle *hlt)
    {
        if (m_hlt == hlt)
            return;

        m_hlt = hlt;
        emit hltChanged(hlt);
    }

    void Brewery::setMlt(Kettle *mlt)
    {
        if (m_mlt == mlt)
            return;

        m_mlt = mlt;
        emit mltChanged(mlt);
    }

    void Brewery::setBlt(Kettle *blt)
    {
        if (m_blt == blt)
            return;

        m_blt = blt;
        emit bltChanged(blt);
    }
}

/*void Brewery::setHltTemp(double temp)
{
    if(temp != hotLiquorTank.currentTemp())
    {
        hotLiquorTank.setCurrentTemp(temp);
        emit hltTempChanged();
    }
}*/

/*double Brewery::getHltTemp()
{
    return hotLiquorTank.currentTemp();
}*/

