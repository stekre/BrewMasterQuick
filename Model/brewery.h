#ifndef BREWERY_H
#define BREWERY_H

#include <QObject>
#include "Model/kettle.h"

namespace brewmaster
{
    class Brewery : public QObject
    {
        Q_OBJECT
        Q_PROPERTY(Kettle* hlt READ hlt WRITE setHlt NOTIFY hltChanged)
        Q_PROPERTY(Kettle* mlt READ mlt WRITE setMlt NOTIFY mltChanged)
        Q_PROPERTY(Kettle* blt READ blt WRITE setBlt NOTIFY bltChanged)

    public:
        explicit Brewery(QObject *parent = 0);
        Kettle* hlt() const;
        Kettle* mlt() const;
        Kettle* blt() const;

    signals:
        void hltChanged(Kettle* hlt);
        void mltChanged(Kettle* mlt);
        void bltChanged(Kettle* blt);

    public slots:
        void setHlt(Kettle* hlt);
        void setMlt(Kettle* mlt);
        void setBlt(Kettle* blt);

    private:
        Kettle* m_hlt;
        Kettle* m_mlt;
        Kettle* m_blt;
    };
}
#endif // BREWERY_H
