import QtQuick 2.8
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.3


Item {
    id: secondPage
    width: 800
    height: 480


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
                }

                Kettle{
                    id: kettleMlt
                    Layout.fillWidth: true
                    temperatureText: "30C"
                    literText: "20L"
                }

                Kettle{
                    id: kettleBlt
                    Layout.fillWidth: true
                    temperatureText: "100C"
                    literText: "90L"
                }
            }
        }

        Item{
            id: itemBrewControlText
            Layout.alignment: Qt.AlignCenter
            Layout.preferredWidth: 800
            Layout.preferredHeight: 60

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

                    //TODO: invisible when x < 0
                }
            }
        }
    }
}
