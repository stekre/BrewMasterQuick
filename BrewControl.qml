import QtQuick 2.8
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.3


Item {
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
                    id: buttonFill
                    Layout.fillWidth: true
                    buttonText: "FILL"
                    kettleType: kettleHlt
                }

                ControlButton{
                    id: buttonMash
                    Layout.fillWidth: true
                    buttonText: "MASH"
                    kettleType: kettleMlt
                }

                ControlButton{
                    id: buttonBoil
                    Layout.fillWidth: true
                    buttonText: "BOIL"
                    kettleType: kettleBlt
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
                    temperatureText: "70C"
                    literText: "60L"
                    powerActive: MainViewMgr.hltPowerActive
                }

                Kettle{
                    id: kettleMlt
                    Layout.fillWidth: true
                    temperatureText: "30C"
                    literText: "20L"
                    powerActive: MainViewMgr.mltPowerActive
                }

                Kettle{
                    id: kettleBlt
                    Layout.fillWidth: true
                    temperatureText: "100C"
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

    NumPad{
        id:keyboard
    }
}
