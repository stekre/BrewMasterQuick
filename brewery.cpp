#include "brewery.h"

Brewery::Brewery(QObject *parent) : QObject(parent)
{
}

void Brewery::setHltTemp(double temp)
{
    if(temp != hotLiquorTank.temp())
    {
        hotLiquorTank.setTemp(temp);
        emit hltTempChanged();
    }
}

double Brewery::getHltTemp()
{
    return hotLiquorTank.temp();
}

