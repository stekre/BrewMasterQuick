#include <stdlib.h>
#include "kettle.h"

Kettle::Kettle(QObject *parent) : QObject(parent)
{
    mCurrentTemp.push_back(10);
}

double Kettle::currentTemp() const
{
    return mCurrentTemp.at(0);
}

void Kettle::setCurrentTemp(const double &temp)
{
    mCurrentTemp.at(0) = temp;
}

double Kettle::flow() const
{
    return mCurrentFlow.at(0);
}

void Kettle::setFlow(const double &flow)
{
    mCurrentFlow.at(0) = flow;
}

double Kettle::wantedTemp() const
{
    return mWantedTemp;
}

void Kettle::setWantedTemp(double wantedTemp)
{
    mWantedTemp = wantedTemp;
}

bool Kettle::getHeaterActive() const
{
    return heaterActive;
}

void Kettle::setHeaterActive(bool value)
{
    heaterActive = value;
}
