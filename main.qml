import QtQuick 2.8
import QtQuick.Window 2.2

Window {
    id:root

    property int mWidth: 800
    property int mHeight: 480

    visible: true
    minimumWidth: mWidth
    minimumHeight: mHeight
    //maximumHeight: minimumHeight
    //maximumWidth: minimumWidth
    title: qsTr(MainViewMgr.appName)

    /*Connections {
        target: brewery
        onHltTempChanged: {
            console.log("Temp changed")
        }
    }*/

    SwipeViewControl {
        id: swipeViewControl
        anchors.fill: parent
    }    
}
