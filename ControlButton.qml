import QtQuick 2.0
import QtQuick.Controls 2.2

Button {
    property string buttonText
    property int buttonWidth: (buttonText.length*14)+25

    id: buttonBrewControl
    text: qsTr(buttonText)
    font.family: "Impact"
    font.bold: true
    font.pointSize: 20
    checkable: true
    background: Rectangle {
        implicitWidth: buttonWidth
        implicitHeight: 40
        color: buttonBrewControl.checked ? "#ff8514" : "#ffffff"
        radius: 4
    }
}

