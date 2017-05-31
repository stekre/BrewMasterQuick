#ifndef MASHDATA_H
#define MASHDATA_H

#include <QObject>

class MashData : public QObject
{
    Q_OBJECT
    Q_PROPERTY(int minute READ minute WRITE setMinute NOTIFY minuteChanged)
    Q_PROPERTY(int temperature READ temperature WRITE setTemperature NOTIFY temperatureChanged)

public:
    explicit MashData(QObject *parent = 0);
    MashData(const int &minute, const int &temperature, QObject *parent = 0);
    int minute() const;
    int temperature() const;

signals:
    void minuteChanged(int minute);
    void temperatureChanged(int temperature);

public slots:
    void setMinute(int minute);
    void setTemperature(int temperature);

private:
    int m_minute;
    int m_temperature;

};

#endif // MASHDATA_H
