#include <stdlib.h>
#include "kettle.h"

namespace brewmaster
{
    Kettle::Kettle(QObject *parent) : QObject(parent)
    {
        //mCurrentTemp.push_back(10);
    }

    double Kettle::currentTemp() const
    {
        return m_currentTemp;
    }

    double Kettle::flow() const
    {
        return m_flow;
    }

    double Kettle::wantedTemp() const
    {
        return m_wantedTemp;
    }

    bool Kettle::heaterActive() const
    {
        return m_heaterActive;
    }

    double Kettle::currentLiter() const
    {
        return m_currentLiter;
    }

    void Kettle::setCurrentTemp(const double currentTemp)
    {
        if (m_currentTemp == currentTemp)
            return;

        m_currentTemp = currentTemp;
        emit currentTempChanged(currentTemp);
    }

    void Kettle::setFlow(double flow)
    {
        if (m_flow == flow)
            return;

        m_flow = flow;
        emit flowChanged(flow);
    }

    void Kettle::setWantedTemp(double wantedTemp)
    {
        if (m_wantedTemp == wantedTemp)
            return;

        m_wantedTemp = wantedTemp;
        emit wantedTempChanged(wantedTemp);
    }

    void Kettle::setHeaterActive(bool heaterActive)
    {
        if (m_heaterActive == heaterActive)
            return;

        m_heaterActive = heaterActive;
        emit heaterActiveChanged(heaterActive);
    }

    void Kettle::setCurrentLiter(double currentLiter)
    {
        if (m_currentLiter == currentLiter)
            return;

        m_currentLiter = currentLiter;
        emit currentLiterChanged(currentLiter);
    }

    /*double Kettle::flow() const
    {
        return mCurrentFlow.at(0);
    }



    /*void Kettle::setFlow(const double &flow)
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
    }*/
}
