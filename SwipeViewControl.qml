import QtQuick 2.8
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.3


Rectangle {
    id: swipeViewControl
    width: mWidth
    height: mHeight
    color: "#000000"

    SwipeView {
        id: view
        width: mWidth
        height: mHeight

        currentIndex: 1
        anchors.fill: parent

        BrewPlan {
            id: brewPlan
        }
        BrewControl {
            id: brewControl
        }
        BrewSetup {
            id: brewSetup
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
