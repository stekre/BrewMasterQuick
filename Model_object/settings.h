#ifndef SETTINGS_H
#define SETTINGS_H

#include <QDir>
#include <QObject>
#include <QJsonObject>


class Settings : public QObject
{
    Q_OBJECT
public:
    explicit Settings(QObject *parent = 0, QString filename = "settings.json");
    bool loadSettings();
    //bool saveSettings();
    void read(const QJsonObject &json);
    void write(QJsonObject &json) const;

signals:

public slots:

private:
    QString mFilename;
    int mTemp1DigitalIn;
    int mTemp2DigitalIn;
    int mTemp3DigitalIn;
    QDir OpenConfigDirectory();
    bool ReadJsonFromInternalResource();
    void saveJson(QJsonDocument document, QString fileName);
    QJsonDocument loadJson(const QString fileName);
    void WriteDefaultsToStdConfigFile(const QJsonDocument document, const QString fileName);
    QJsonDocument loadJsonFromInternalResource();
};

#endif // SETTINGS_H
