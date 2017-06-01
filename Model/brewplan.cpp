#include "brewplan.h"
#include <QDebug>

Brewplan::Brewplan(QObject *parent) : QObject(parent)
{
    m_mashplan.append(new MashData(0,55));
    m_mashplan.append(new MashData(15,65));
    m_mashplan.append(new MashData(60,75));
}

QList<QObject *> Brewplan::mashplan() const
{
    return m_mashplan;
}

void Brewplan::addMashStep(int temp, int min)
{
    qDebug() << "addMashStep: " << temp << " : " << min;
    m_mashplan.append(new MashData(min,temp));
    emit mashplanChanged(m_mashplan);
}

/*void Brewplan::setMashplan(QList<QObject *> mashplan)
{
    if (m_mashplan == mashplan)
        return;

    m_mashplan = mashplan;
    emit mashplanChanged(mashplan);
}*/

/*Brewplan::Brewplan(const int &minute, const int &temperature, QObject *parent)
    : QObject(parent), m_minute(minute), m_temperature(temperature)
{

}*/
