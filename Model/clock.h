#ifndef CLOCK_H
#define CLOCK_H

#include <QObject>
#include <QElapsedTimer>
#include <QTimer>

class Clock : public QObject
{
    Q_OBJECT
    Q_PROPERTY(int elapsed MEMBER m_elapsed NOTIFY elapsedChanged)
    Q_PROPERTY(bool running MEMBER m_running NOTIFY runningChanged)

public:
    explicit Clock(QObject *parent = 0);

signals:    
    void elapsedChanged();
    void runningChanged();

public slots:
    void start();
    void stop();

private:
    QElapsedTimer m_timer;
    QTimer m_trigger;
    int m_elapsed{0};
    bool m_running{false};

private slots:
    void triggerEvent();
};

#endif // CLOCK_H
