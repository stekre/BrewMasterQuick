import QtQuick 2.0
import QtQuick.Controls 2.2

Item {    
    property int xPos
    property int yPos
    property string buttonText
    property var kettleType

    Button {
         id: buttonBrewControl
         anchors.centerIn: parent
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
         /*onClicked: {
             brewery.setHltTemp(brewery.getHltTemp()+5);
             kettleType.wavesVisible = true
         }*/
     }
}
