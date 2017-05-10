#include "kettle.h"

Kettle::Kettle(QObject *parent) : QObject(parent)
{
    mCurrentTemp.push_back(10);
}

double Kettle::temp() const
{
    return mCurrentTemp.at(0);
}

void Kettle::setTemp(const double &temp)
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
