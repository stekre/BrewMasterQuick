#ifndef KETTLE_H
#define KETTLE_H

#include <QObject>
#include <stdlib.h>

class Kettle : public QObject
{
    Q_OBJECT
public:
    explicit Kettle(QObject *parent = 0);

    double temp() const;
    void setTemp(const double &temp);

    double flow() const;
    void setFlow(const double &flow);

    double wantedTemp() const;
    void setWantedTemp(double setpointTemp);

signals:

public slots:

private:
    std::vector<double> mCurrentTemp;
    std::vector<double> mCurrentFlow;
    double mWantedTemp;
};

#endif // KETTLE_H
