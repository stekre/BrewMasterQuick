import QtQuick 2.8
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.3


Item {
    //property bool powerOn: value

    function toggleHltPower()
    {
        MainViewMgr.setHltPowerActive(!MainViewMgr.hltPowerActive)
    }

    width: mWidth
    height: mHeight

    ColumnLayout{
        id: columnBrewControl
        anchors.fill: parent

        Item{
            id: itemBrewControlButton
            Layout.alignment: Qt.AlignCenter
            Layout.preferredWidth: 800
            Layout.preferredHeight: 80

            RowLayout{
                id: rowBrewControlButton
                Layout.alignment: Qt.AlignTop
                anchors.fill: parent

                ControlButton{
                    id: buttonBrewControl
                    Layout.alignment: Qt.AlignCenter
                    buttonText: "FILL"                    
                    onClicked: {
                        toggleHltPower()
                        kettleHlt.wavesVisible = true
                    }
                }

                ControlButton{
                    id: buttonMash
                    Layout.alignment: Qt.AlignCenter
                    buttonText: "MASH"                    
                    onClicked: {
                        MainViewMgr.setMltPowerActive(true)
                        kettleMlt.wavesVisible = true
                    }
                }

                ControlButton{
                    id: buttonBoil
                    Layout.alignment: Qt.AlignCenter
                    buttonText: "BOIL"                    
                    onClicked: {
                        MainViewMgr.setBltPowerActive(true)
                        kettleBlt.wavesVisible = true
                    }
                }
            }
        }

        Item{
            id: itemBrewControlKettle
            Layout.alignment: Qt.AlignCenter
            Layout.preferredWidth: 800
            Layout.preferredHeight: 300

            RowLayout{
                id: rowBrewControlKettle
                Layout.alignment: Qt.AlignTop
                anchors.fill: parent

                Kettle{
                    id: kettleHlt
                    Layout.fillWidth: true
                    temperature: MainViewMgr.hltTemperature
                    wantedTemperature: MainViewMgr.hltWantedTemp
                    literText: "60L"
                    powerActive: MainViewMgr.hltPowerActive
                    onWantedTemperatureChanged: MainViewMgr.hltWantedTemp = wantedTemperature
                }

                Kettle{
                    id: kettleMlt
                    Layout.fillWidth: true
                    temperature: 30
                    literText: "20L"
                    powerActive: MainViewMgr.mltPowerActive
                }

                Kettle{
                    id: kettleBlt
                    Layout.fillWidth: true
                    temperature: 100
                    literText: "90L"
                    powerActive: MainViewMgr.bltPowerActive
                }
            }
        }

        Item{
            id: itemBrewControlText
            Layout.alignment: Qt.AlignCenter
            Layout.preferredWidth: 800
            Layout.preferredHeight: 60
            clip: true

            Text {
                id: textBrewControl
                x: 800
                color: "#ffffff"
                text: qsTr("Add 120g Amarillo")
                font.family: "Verdana"
                fontSizeMode: Text.VerticalFit
                font.pixelSize: 30
                visible: true

                NumberAnimation on x {
                    loops: Animation.Infinite
                    duration: 10000
                    from: 800
                    to: -1*textBrewControl.width
                }
            }
        }
    }

    /**/
}
