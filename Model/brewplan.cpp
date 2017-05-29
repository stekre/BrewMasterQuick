#include "brewplan.h"

Brewplan::Brewplan(QObject *parent) : QObject(parent)
{

}

Brewplan::Brewplan(const int &minute, const int &temperature, QObject *parent)
    : QObject(parent), m_minute(minute), m_temperature(temperature)
{

}

int Brewplan::minute() const
{
    return m_minute;
}

int Brewplan::temperature() const
{
    return m_temperature;
}

void Brewplan::setMinute(int minute)
{
    if (m_minute == minute)
        return;

    m_minute = minute;
    emit minuteChanged(minute);
}

void Brewplan::setTemperature(int temperature)
{
    if (m_temperature == temperature)
        return;

    m_temperature = temperature;
    emit temperatureChanged(temperature);
}
