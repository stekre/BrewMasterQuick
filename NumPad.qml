import QtQuick 2.0
import QtQuick.Controls 2.2
import QtQuick.VirtualKeyboard 2.1

Dialog {
    title: "Input Number"
    height: 150
    width: 300
    x: (parent.width/2)-(width/2)
    y: (parent.height/2)-(height/2)
    standardButtons: StandardButton.Ok | StandardButton.Cancel

    /*Column {
        anchors.fill: parent
        Text {
            text: "Name"
            height: 40
        }
        TextField {
            id: digitsField

            width: parent.width
            //previewText: "Digits only field"
            inputMethodHints: Qt.ImhDigitsOnly
            enterKeyAction: EnterKeyAction.Next
            onEnterKeyClicked: textArea.focus = true
        }*/
        /*TextField {
            id: newFolderInput
            width: parent.width * 0.75
            focus: true
            onFocusChanged: console.log("Focus changed " + focus)
        }
    }*/
}

