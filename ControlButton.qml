import QtQuick 2.0
import QtQuick.Controls 2.2

Button {
    property string buttonText

    id: buttonBrewControl
    text: qsTr(buttonText)
    font.family: "Impact"
    font.bold: true
    font.pointSize: 20
    checkable: true
    background: Rectangle {
        implicitWidth: 100
        implicitHeight: 40
        color: buttonBrewControl.checked ? "#ff8514" : "#ffffff"
        radius: 4
    }
}

