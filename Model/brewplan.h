#ifndef BREWPLAN_H
#define BREWPLAN_H

#include <QObject>
#include "mashdata.h"

class Brewplan : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QList<QObject*> mashplan READ mashplan NOTIFY mashplanChanged)
    //Q_PROPERTY(QList<QObject*> brewplan READ brewplan WRITE setBrewplan NOTIFY brewplanChanged)

public:
    explicit Brewplan(QObject *parent = 0);
    //Brewplan(const int &minute, const int &temperature, QObject *parent = 0);
    QList<QObject*> mashplan() const;

signals:
    void mashplanChanged(QList<QObject*> mashplan);

public slots:
    //void setMashplan(QList<QObject*> mashplan);
    void addMashStep(int temp, int min);

private:
    QList<QObject*> m_mashplan;
};

#endif // BREWPLAN_H
