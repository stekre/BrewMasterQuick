#include "clock.h"
#include <QDebug>

Clock::Clock(QObject *parent) :
    QObject(parent)
{

}

void Clock::start()
{
    m_elapsed = 0;
    m_running = true;

    m_timer.start();
    QTimer::singleShot(1000,this, SLOT(triggerEvent()));
    emit runningChanged();
}

void Clock::stop()
{
    m_elapsed = m_timer.elapsed();
    this->m_running = false;

    emit elapsedChanged();
    emit runningChanged();
}

void Clock::triggerEvent()
{
    m_elapsed = m_timer.elapsed();
    emit elapsedChanged();
    QTimer::singleShot(1000,this, SLOT(triggerEvent()));
}

