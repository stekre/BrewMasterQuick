#ifndef MAINVIEWMGR_H
#define MAINVIEWMGR_H

#include <QObject>

class MainViewMgr : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QString appName READ appName CONSTANT)
public:
    explicit MainViewMgr(QObject *parent = 0);
    QString appName() const {return m_appName;}
signals:

public slots:

private:
    QString m_appName {"BrewMaster Quick"};
};

#endif // MAINVIEWMGR_H
