#ifndef MAINVIEWMGR_H
#define MAINVIEWMGR_H

#include <QObject>
#include <QDebug>

class MainViewMgr : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QString appName READ appName CONSTANT)
    Q_PROPERTY(bool hltPowerActive READ hltPowerActive WRITE setHltPowerActive NOTIFY hltPowerActiveChanged)
    Q_PROPERTY(bool mltPowerActive READ mltPowerActive WRITE setMltPowerActive NOTIFY mltPowerActiveChanged)
    Q_PROPERTY(bool bltPowerActive READ bltPowerActive WRITE setBltPowerActive NOTIFY bltPowerActiveChanged)
    Q_PROPERTY(double hltTemperature READ hltTemperature WRITE setHltTemperature NOTIFY hltTemperatureChanged)
    Q_PROPERTY(double hltWantedTemp READ hltWantedTemp WRITE setHltWantedTemp NOTIFY hltWantedTempChanged)
public:
    explicit MainViewMgr(QObject *parent = 0);
    QString appName() const {return m_appName;}
    bool hltPowerActive() const
    {
        return m_hltPowerActive;
    }

    bool mltPowerActive() const
    {
        return m_mltPowerActive;
    }

    bool bltPowerActive() const
    {
        return m_bltPowerActive;
    }

    double hltTemperature() const
    {
        return m_hltTemperature;
    }

    double hltWantedTemp() const
    {
        return m_hltWantedTemp;
    }

signals:
    void hltPowerActiveChanged(bool hltPowerActive);
    void mltPowerActiveChanged(bool mltPowerActive);
    void bltPowerActiveChanged(bool bltPowerActive);    
    void hltTemperatureChanged(double hltTemperature);

    void hltWantedTempChanged(double hltWantedTemp);

public slots:
    void setHltPowerActive(bool hltPowerActive)
    {
        if (m_hltPowerActive == hltPowerActive)
            return;

        m_hltPowerActive = hltPowerActive;
        emit hltPowerActiveChanged(hltPowerActive);
    }

    void setMltPowerActive(bool mltPowerActive)
    {
        if (m_mltPowerActive == mltPowerActive)
            return;

        m_mltPowerActive = mltPowerActive;
        emit mltPowerActiveChanged(mltPowerActive);
    }

    void setBltPowerActive(bool bltPowerActive)
    {
        if (m_bltPowerActive == bltPowerActive)
            return;

        m_bltPowerActive = bltPowerActive;
        emit bltPowerActiveChanged(bltPowerActive);
    }

    void setHltTemperature(double hltTemperature)
    {
        if (m_hltTemperature == hltTemperature)
            return;

        m_hltTemperature = hltTemperature;
        emit hltTemperatureChanged(hltTemperature);
    }

    void setHltWantedTemp(double hltWantedTemp)
    {
        if (m_hltWantedTemp == hltWantedTemp)
            return;

        m_hltWantedTemp = hltWantedTemp;
        qDebug() << "Wanted temp: " << m_hltWantedTemp;
        emit hltWantedTempChanged(hltWantedTemp);
    }

private:
    QString m_appName {"BrewMaster Quick"};
    bool m_hltPowerActive{false};
    bool m_mltPowerActive{false};
    bool m_bltPowerActive{false};
    double m_hltTemperature{66.1};
    double m_hltWantedTemp{77};
};

#endif // MAINVIEWMGR_H
