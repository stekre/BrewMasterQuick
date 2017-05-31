#include "brewplan.h"

Brewplan::Brewplan(QObject *parent) : QObject(parent)
{
    m_mashplan.append(new MashData(50,25));
}

QList<QObject *> Brewplan::mashplan() const
{
    return m_mashplan;
}

void Brewplan::setMashplan(QList<QObject *> mashplan)
{
    if (m_mashplan == mashplan)
        return;

    m_mashplan = mashplan;
    emit mashplanChanged(mashplan);
}

/*Brewplan::Brewplan(const int &minute, const int &temperature, QObject *parent)
    : QObject(parent), m_minute(minute), m_temperature(temperature)
{

}*/
