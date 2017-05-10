import QtQuick 2.8
import QtQuick.Controls 2.2
import QtQuick.Extras 1.4
import QtQuick.Layouts 1.3
import Qt.labs.settings 1.0
import QtQuick.Controls.Material 2.0
import QtQuick.Window 2.3

Rectangle {
    //

    width: 800
    height: 480
    color: "#000000"
    property alias firstPage: firstPage
   // property alias buttonBoil: buttonBoil
   // property alias buttonFill: buttonFill


    SwipeView {
        id: view
        width: 800
        height: 480

        currentIndex: 1
        anchors.fill: parent

        BrewPlan {
            id: firstPage
        }
        BrewControl {
            id: secondPage
        }
        BrewSetup {
            id: thirdPage
        }
    }

    PageIndicator {
        id: indicator

        count: view.count
        currentIndex: view.currentIndex

        anchors.bottom: view.bottom
        anchors.horizontalCenter: parent.horizontalCenter
    }
}
