#ifndef KETTLE_H
#define KETTLE_H

#include <QObject>

class Kettle : public QObject
{
    Q_OBJECT
public:
    explicit Kettle(QObject *parent = 0);

    double currentTemp() const;
    void setCurrentTemp(const double &currentTemp);

    double flow() const;
    void setFlow(const double &flow);

    double wantedTemp() const;
    void setWantedTemp(double setpointTemp);

    bool getHeaterActive() const;
    void setHeaterActive(bool value);

signals:

public slots:

private:
    std::vector<double> mCurrentTemp{0};
    std::vector<double> mCurrentFlow{0};
    double mWantedTemp{0};
    bool heaterActive{false};
};

#endif // KETTLE_H
