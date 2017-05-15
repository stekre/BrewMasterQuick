#include <QStandardPaths>
#include <QJsonDocument>
#include <QDebug>

#include "settings.h"

static auto RESOURCE_PREFIX =  QStringLiteral(":/json");

Settings::Settings(QObject *parent, QString filename) :
    QObject(parent),
    mFilename(filename)
{
}

bool Settings::loadSettings()
{
    bool settingsLoaded = false;
    QDir config_dir = OpenConfigDirectory();
    auto path = config_dir.filePath(mFilename);
    QJsonDocument configJsonDoc { loadJson(path) };

    if (!configJsonDoc.isNull())
    {
        read(configJsonDoc.object());
        settingsLoaded = true;
    }
    else
    {
        configJsonDoc = { loadJsonFromInternalResource() };
        if(!configJsonDoc.isNull())
        {
            read(configJsonDoc.object());
            WriteDefaultsToStdConfigFile(configJsonDoc,path);
            settingsLoaded = true;
        }
    }
    return settingsLoaded;
}

QDir Settings::OpenConfigDirectory()
{
    QDir config_dir(QStandardPaths::writableLocation(QStandardPaths::ConfigLocation ));
    if (!config_dir.exists())
    {
        QDir dir;
        dir.mkpath(config_dir.path());
    }
    return config_dir;
}

QJsonDocument Settings::loadJsonFromInternalResource()
{
    QJsonDocument jsonDocument;
    QDir res_dir(RESOURCE_PREFIX);
    if (res_dir.exists())
    {
        auto path = res_dir.filePath(mFilename);
        jsonDocument = { loadJson(path) };
    }
    else
    {
        qWarning() << "Internal resource path missing " <<
                      res_dir.canonicalPath();
    }

    return jsonDocument;
}

void Settings::WriteDefaultsToStdConfigFile(const QJsonDocument document,
                                            const QString fileName)
{
    saveJson(document, fileName);
}

QJsonDocument Settings::loadJson(const QString fileName)
{
    QJsonDocument jsonDocument;
    QFile jsonFile(fileName);
    if (jsonFile.exists())
    {
        if (jsonFile.open(QFile::ReadOnly))
        {
            jsonDocument = QJsonDocument::fromJson(jsonFile.readAll());
        }
        else
        {
            qWarning() << "Could not open file: " << fileName;
        }
    }
    return jsonDocument;
}

void Settings::saveJson(const QJsonDocument document, const QString fileName)
{
    QFile jsonFile(fileName);
    if(!jsonFile.open(QFile::WriteOnly))
    {
        qWarning() << "Could not open file to write - " << fileName;
    }

    jsonFile.write(document.toJson());
}

void Settings::read(const QJsonObject &json)
{
    mTemp1DigitalIn = json["temp1DigitalIn"].toInt();
    mTemp2DigitalIn = json["temp2DigitalIn"].toInt();
    mTemp3DigitalIn = json["temp3DigitalIn"].toInt();
    qDebug() << "mTemp1DigitalIn:" << mTemp1DigitalIn << " mTemp2DigitalIn:"
             << mTemp2DigitalIn << " mTemp3DigitalIn:" << mTemp3DigitalIn;
}

void Settings::write(QJsonObject &json) const
{
    json["temp1DigitalIn"] = mTemp1DigitalIn;
    json["temp2DigitalIn"] = mTemp2DigitalIn;
    json["temp3DigitalIn"] = mTemp3DigitalIn;
}

/*
         * Example on how to save as json or binary
         *
        bool Settings::loadSettings()
        {
            QFile loadFile(saveFormat == Json
                    ? QStringLiteral("save.json")
                    : QStringLiteral("save.dat"));

                if (!loadFile.open(QIODevice::ReadOnly)) {
                    qWarning("Couldn't open save file.");
                    return false;
                }

                QByteArray saveData = loadFile.readAll();

                QJsonDocument loadDoc(saveFormat == Json
                    ? QJsonDocument::fromJson(saveData)
                    : QJsonDocument::fromBinaryData(saveData));

                read(loadDoc.object());

                return true;
        }*/
