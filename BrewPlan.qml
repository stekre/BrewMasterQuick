import QtQuick 2.8
import QtQuick.Controls 2.2
import QtQuick.Extras 1.4
import QtQuick.Layouts 1.3
import Qt.labs.settings 1.0
import QtQuick.Controls.Material 2.0
import QtQuick.Window 2.3
import TextFieldDoubleValidator 1.0

Item {    
    
    width: mWidth
    height: mHeight
    
    /* TOP FIELD */
    Rectangle {
        id: rectangle
        x: 0
        y: 0
        width: 800
        height: 100
        color: "#302f2f"

        TextField {
            id: textField
            x: 8
            y: 52
            width: 130
            height: 28
            text: qsTr("Strike Water Temp")
        }

        Text {
            id: text1
            x: 313
            y: 0
            color: "#ffffff"
            text: qsTr("Brew Plan")
            horizontalAlignment: Text.AlignHCenter
            font.bold: true
            font.family: "Verdana"
            font.pixelSize: 30
        }

        TextField {
            id: textField1
            x: 169
            y: 52
            width: 130
            height: 28
            text: qsTr("Text Field")
        }

        TextField {
            id: textField2
            x: 333
            y: 52
            width: 130
            height: 28
            text: qsTr("Text Field")
        }

        TextField {
            id: textField3
            x: 497
            y: 52
            width: 130
            height: 28
            text: qsTr("Text Field")
        }

        TextField {
            id: textField4
            x: 662
            y: 52
            width: 130
            height: 28
            text: qsTr("Text Field")
        }
    }

    /* MASH PLAN */    
    Text {
        id: textMashPlanHeader
        x: 40
        y: 122
        color: "#ffffff"
        text: qsTr("MASH PLAN")
        font.pixelSize: 30
        font.bold: true
        font.family: "Verdana"
    }

    Component {
        id: listDelegate
        Item {
            width: 80; height: 30
            Row {
                Text {
                    width: 50
                    font.pixelSize: 15
                    font.bold: true
                    font.family: "Verdana"
                    color: "#ffffff"
                    text: model.modelData.temperature +"C "
                }
                Text {
                    width: 200
                    font.pixelSize: 15
                    font.bold: true
                    font.family: "Verdana"
                    color: "#ffffff"
                    text: "From Minute " + model.modelData.minute
                }
            }
        }
    }
    
    Rectangle {
        x: 40
        y: 154
        width: 273
        height: 211
        color: "transparent"
        border.width: 4
        border.color: "#ffffff"
        radius: 5
        
        
        ListView {
            id: listView
            x: 8
            y: 8
            width: 257
            height: 195
            model: MainViewMgr.brewplan.mashplan
            delegate: listDelegate
            focus: true
        }
    }
            
    TextField {
        id: textFieldMinute
        x: 40
        y: 371
        width: 136
        height: 28
        color: "#ffffff"
        font.family: "Verdana"
        font.pixelSize: 15
        placeholderText: "Minute"
        inputMethodHints: Qt.ImhDigitsOnly
        background: Rectangle {
            radius: 4
            color: "#000000"
            border.color: "#333"
            border.width: 2
        }
        validator: TextFieldDoubleValidator {
            bottom: 0
            top: 999
            decimals: 0
            notation: "StandardNotation"
        }
        //onPressed: numPad()
    }
    
    TextField {
        id: textFieldTemperature
        x: 180
        y: 371
        width: 136
        height: 28
        color: "#ffffff"
        font.family: "Verdana"
        font.pixelSize: 15
        placeholderText: "Temperature"
        inputMethodHints: Qt.ImhDigitsOnly
        background: Rectangle {
            radius: 4
            color: "#000000"
            border.color: "#333"
            border.width: 2
        }
        validator: TextFieldDoubleValidator {
            bottom: 0
            top: 100
            decimals: 1
            notation: "StandardNotation"
        }
    }
    
    Button {
        id: buttonAdd
        x: 40
        y: 405
        text: qsTr("Add Step")
        font.family: "Verdana"
        font.pointSize: 15
        onClicked: {
            MainViewMgr.brewplan.addMashStep(textFieldMinute.text,textFieldTemperature.text)

            /*listModel.append({
                "Minute": +textFieldMinute.text,
                "Temperature": +textFieldTemperature.text
            })*/
        }
    }

    Button {
        id: buttonClear
        x: 180
        y: 405
        text: qsTr("Clear Steps")
        font.family: "Verdana"
        font.pointSize: 15
        onClicked: {
            listModel.clear()
        }
    }
    
    /* HOPS PLAN */
    Text {
        id: textHopsPlanHeader
        x: 480
        y: 122
        color: "#ffffff"
        text: qsTr("HOPS PLAN")
        font.pixelSize: 30
        font.bold: true
        font.family: "Verdana"
    }

    Component {
        id: listDelegateHops
        Item {
            width: 80; height: 30
            Row {
                Text {
                    width: 75
                    font.pixelSize: 15
                    font.bold: true
                    font.family: "Verdana"
                    color: "#ffffff"
                    text: Minute +" Min "
                }
                Text {
                    width: 200
                    x: 30
                    font.pixelSize: 15
                    font.bold: true
                    font.family: "Verdana"
                    color: "#ffffff"
                    text: Name
                }
                Text {
                    width: 60
                    font.pixelSize: 15
                    font.bold: true
                    font.family: "Verdana"
                    color: "#ffffff"
                    text: Grams +" g "
                    horizontalAlignment: Text.AlignRight
                }
            }
        }
    }
    
    /*ListModel {
        id: listModelHops
        
        ListElement {
            Name: "Citra"
            Grams: 50
            Minute: 10
        }
        
        ListElement {
            Name: "Centennial"
            Grams: 250
            Minute: 45
        }
    }*/
    
    Rectangle {
        id: listViewHopsRect
        x: 400
        y: 154
        width: 350
        height: 211
        color: "transparent"
        border.width: 4
        border.color: "#ffffff"
        radius: 5
        
        
        ListView {
            id: listViewHops
            x: parent.x+8
            y: parent.x+8
            width: 257
            height: 195
            model: listModelHops
            delegate: listDelegateHops
            focus: true
        }
    }

    TextField {
        id: textFieldNameHops
        x: listViewHopsRect.x
        y: 371
        width: 136
        height: 28
        color: "#ffffff"
        font.family: "Verdana"
        font.pixelSize: 15
        placeholderText: "Hops Name"
        background: Rectangle {
            radius: 4
            color: "#000000"
            border.color: "#333"
            border.width: 2
        }
    }

    TextField {
        id: textFieldGramsHops
        //x: 620
        y: 371
        anchors.left: textFieldNameHops.right
        anchors.leftMargin: 10
        width: 100
        height: 28
        color: "#ffffff"
        font.family: "Verdana"
        font.pixelSize: 15
        placeholderText: "Grams"
        inputMethodHints: Qt.ImhDigitsOnly
        background: Rectangle {
            radius: 4
            color: "#000000"
            border.color: "#333"
            border.width: 2
        }
        validator: TextFieldDoubleValidator {
            bottom: 0
            top: 9999
            decimals: 0
            notation: "StandardNotation"
        }
    }

    TextField {
        id: textFieldMinuteHops
        //x: 700
        y: 371
        anchors.left: textFieldGramsHops.right
        anchors.leftMargin: 10
        width: 100
        height: 28
        color: "#ffffff"
        font.family: "Verdana"
        font.pixelSize: 15
        placeholderText: "Minutes"
        inputMethodHints: Qt.ImhDigitsOnly
        background: Rectangle {
            radius: 4
            color: "#000000"
            border.color: "#333"
            border.width: 2
        }
        validator: TextFieldDoubleValidator {
            bottom: 0
            top: 999
            decimals: 0
            notation: "StandardNotation"
        }
    }

    Button {
        id: buttonAddHops
        x: listViewHopsRect.x
        y: 405
        text: qsTr("Add Step")
        font.family: "Verdana"
        font.pointSize: 15
        onClicked: {

        }
    }
    
    Button {
        id: buttonClearHops
        //x: 480
        y: 405
        anchors.left: buttonAddHops.right
        anchors.leftMargin: 10
        text: qsTr("Clear Steps")
        font.family: "Verdana"
        font.pointSize: 15
        onClicked: {
            listModel.clear()
        }
    }
}
