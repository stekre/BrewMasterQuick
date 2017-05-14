import QtQuick 2.8
import QtQuick.Window 2.2

Window {
    visible: true
    minimumWidth: 800
    minimumHeight: 480
    //maximumHeight: minimumHeight
    //maximumWidth: minimumWidth
    title: qsTr("BrewMaster")

    Connections {
        target: brewery
        onHltTempChanged: {
            console.log("Temp changed")
        }
    }

    MainForm {
        anchors.fill: parent        
    }
}
