#ifndef HOPSDATA_H
#define HOPSDATA_H

#include <QObject>

class HopsData : public QObject
{
    Q_OBJECT
public:
    explicit HopsData(QObject *parent = 0);

signals:

public slots:

private:
    int minute;
    int grams;
    QString name;
};

#endif // HOPSDATA_H
