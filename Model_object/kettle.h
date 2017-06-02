#ifndef KETTLE_H
#define KETTLE_H

#include <QObject>

namespace brewmaster
{
    class Kettle : public QObject
    {
        Q_OBJECT
        Q_PROPERTY(double currentTemp READ currentTemp WRITE setCurrentTemp NOTIFY currentTempChanged)
        Q_PROPERTY(double flow READ flow WRITE setFlow NOTIFY flowChanged)
        Q_PROPERTY(double wantedTemp READ wantedTemp WRITE setWantedTemp NOTIFY wantedTempChanged)
        Q_PROPERTY(bool heaterActive READ heaterActive WRITE setHeaterActive NOTIFY heaterActiveChanged)
        Q_PROPERTY(double currentLiter READ currentLiter WRITE setCurrentLiter NOTIFY currentLiterChanged)
    public:
        explicit Kettle(QObject *parent = 0);
        double currentTemp() const;
        double flow() const;
        double wantedTemp() const;
        bool heaterActive() const;
        double currentLiter() const;

    signals:
        void currentTempChanged(double currentTemp);
        void flowChanged(double flow);
        void wantedTempChanged(double wantedTemp);
        void heaterActiveChanged(bool heaterActive);
        void currentLiterChanged(double currentLiter);

    public slots:
        void setCurrentTemp(const double currentTemp);
        void setFlow(double flow);
        void setWantedTemp(double wantedTemp);
        void setHeaterActive(bool heaterActive);
        void setCurrentLiter(double currentLiter);

    private:
        //std::vector<double> mCurrentTemp{0};  if several temp sens is needed
        double m_currentTemp{50};
        double m_flow{0};
        double m_wantedTemp{0};
        bool m_heaterActive{false};
        double m_currentLiter{0};
    };
};
#endif // KETTLE_H
