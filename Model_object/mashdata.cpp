#include "mashdata.h"

MashData::MashData(QObject *parent) : QObject(parent)
{

}

MashData::MashData(const int &minute, const int &temperature, QObject *parent)
    : QObject(parent), m_minute(minute), m_temperature(temperature)
{

}

int MashData::minute() const
{
    return m_minute;
}

int MashData::temperature() const
{
    return m_temperature;
}

void MashData::setMinute(int minute)
{
    if (m_minute == minute)
        return;

    m_minute = minute;
    emit minuteChanged(minute);
}

void MashData::setTemperature(int temperature)
{
    if (m_temperature == temperature)
        return;

    m_temperature = temperature;
    emit temperatureChanged(temperature);
}
