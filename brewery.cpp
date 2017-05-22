#include "kettle.h"
#include "brewery.h"

Brewery::Brewery(QObject *parent) : QObject(parent)
{
}

void Brewery::setHltTemp(double temp)
{
    if(temp != hotLiquorTank.currentTemp())
    {
        hotLiquorTank.setCurrentTemp(temp);
        emit hltTempChanged();
    }
}

double Brewery::getHltTemp()
{
    return hotLiquorTank.currentTemp();
}

