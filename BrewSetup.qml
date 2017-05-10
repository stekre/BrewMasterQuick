import QtQuick 2.8
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.3

Item {
    id: thirdPage
    width: 800

    Rectangle {
        id: rectangle
        anchors.fill: parent
        color: "#302f2f"

        GridLayout {
            id: gridSetup
            columns: 3
            anchors.fill: parent

            Text {
                id: text1
                Layout.columnSpan: 3
                Layout.alignment: Qt.AlignTop | Qt.AlignCenter
//                x: 0
//                y: 0
//                width: 800
//                height: 50
                color: "#ffffff"
                text: qsTr("Brewery Setup")
                horizontalAlignment: Text.AlignHCenter
                font.bold: true
                font.family: "Verdana"
                font.pixelSize: 30
            }

            Text {
                id: text2
                x: 0
                y: 50
                width: 400
                height: 50
                color: "#ffffff"
                text: qsTr("MLT Temp")
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter
                font.pixelSize: 20
            }

            Text {
                id: text3
                x: 400
                y: 50
                width: 400
                height: 50
                color: "#ffffff"
                text: qsTr("Water Loss")
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter
                font.family: "Verdana"
                font.pixelSize: 20
            }

            Text {
                id: text4
                x: 0
                y: 200
                width: 800
                height: 50
                color: "#ffffff"
                text: qsTr("I/O Setup")
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter
                font.pixelSize: 20
            }
        }
    }
}
