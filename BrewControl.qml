import QtQuick 2.8
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.3


Item {
    //property bool powerOn: value
    property double myLiter: 0

    function toggleHltPower()
    {
        MainViewMgr.brewery.hlt.heaterActive = !MainViewMgr.brewery.hlt.heaterActive
        myLiter+=10
        console.log(myLiter)
    }

    function toggleMltPower()
    {
        MainViewMgr.brewery.mlt.heaterActive = !MainViewMgr.brewery.mlt.heaterActive
        myLiter-=10
        console.log(myLiter)
    }

    function toggleBltPower()
    {
        MainViewMgr.brewery.blt.heaterActive = !MainViewMgr.brewery.blt.heaterActive
    }

    width: mWidth
    height: mHeight

    ColumnLayout{
        id: columnBrewControl
        anchors.fill: parent

        Item{
            id: itemBrewControlButton
            Layout.alignment: Qt.AlignCenter
            Layout.preferredWidth: 800
            Layout.preferredHeight: 80

            RowLayout{
                id: rowBrewControlButton
                Layout.alignment: Qt.AlignTop
                anchors.fill: parent

                ControlButton{
                    id: buttonFill
                    Layout.alignment: Qt.AlignCenter
                    buttonText: "FILL"                    
                    onClicked: {
                        toggleHltPower()
                        kettleHlt.wavesVisible = true
                    }
                }

                ControlButton{
                    id: buttonHeat
                    Layout.alignment: Qt.AlignCenter
                    buttonText: "HEAT"
                    onClicked: {
                        //toggleHltPower()
                        //kettleHlt.wavesVisible = true
                    }
                }

                ControlButton{
                    id: buttonMash
                    Layout.alignment: Qt.AlignCenter
                    buttonText: "MASH"                    
                    onClicked: {
                        toggleMltPower()
                        kettleMlt.wavesVisible = true
                    }
                }

                ControlButton{
                    id: buttonCirculate
                    Layout.alignment: Qt.AlignCenter
                    buttonText: "STEP"
                    onClicked: {
                        toggleMltPower()
                        kettleMlt.wavesVisible = true
                    }
                }

                ControlButton{
                    id: buttonBoil
                    Layout.alignment: Qt.AlignCenter
                    buttonText: "BOIL"                    
                    onClicked: {
                        toggleBltPower()
                        kettleBlt.wavesVisible = true
                    }
                }

                ControlButton{
                    id: buttonCool
                    Layout.alignment: Qt.AlignCenter
                    buttonText: "COOL"
                    onClicked: {
                        toggleBltPower()
                        kettleBlt.wavesVisible = true
                    }
                }
            }
        }

        Item{
            id: itemBrewControlKettle
            Layout.alignment: Qt.AlignCenter
            Layout.preferredWidth: 800
            Layout.preferredHeight: 300

            RowLayout{
                id: rowBrewControlKettle
                Layout.alignment: Qt.AlignTop
                anchors.fill: parent

                Kettle{
                    id: kettleHlt
                    Layout.fillWidth: true
                    temperature: MainViewMgr.brewery.hlt.currentTemp
                    wantedTemperature: MainViewMgr.brewery.hlt.wantedTemp
                    liter: myLiter
                    powerActive: MainViewMgr.brewery.hlt.heaterActive
                    onWantedTemperatureChanged: MainViewMgr.brewery.hlt.wantedTemp = wantedTemperature
                }

                Kettle{
                    id: kettleMlt
                    Layout.fillWidth: true
                    temperature: MainViewMgr.brewery.mlt.currentTemp
                    wantedTemperature: MainViewMgr.brewery.mlt.wantedTemp
                    liter: 20
                    powerActive: MainViewMgr.brewery.mlt.heaterActive
                    onWantedTemperatureChanged: MainViewMgr.brewery.mlt.wantedTemp = wantedTemperature
                }

                Kettle{
                    id: kettleBlt
                    Layout.fillWidth: true
                    temperature: MainViewMgr.brewery.blt.currentTemp
                    wantedTemperature: MainViewMgr.brewery.blt.wantedTemp
                    liter: MainViewMgr.brewery.blt.currentLiter
                    powerActive: MainViewMgr.brewery.blt.heaterActive
                    onWantedTemperatureChanged: MainViewMgr.brewery.blt.wantedTemp = wantedTemperature
                }
            }
        }

        Item{
            id: itemBrewControlText
            Layout.alignment: Qt.AlignCenter
            Layout.preferredWidth: 800
            Layout.preferredHeight: 60
            clip: true

            ControlButton{
                id: buttonHops
                anchors.centerIn: parent
                buttonText: "HOPS ADDED"
                onClicked: {
                    //toggleBltPower()
                    //kettleBlt.wavesVisible = true
                }
            }

            Text {
                id: textBrewControl
                x: 800
                color: "#ffffff"
                text: qsTr("Add 120g Amarillo")
                font.family: "Verdana"
                fontSizeMode: Text.VerticalFit
                font.pixelSize: 30
                visible: true

                NumberAnimation on x {
                    loops: Animation.Infinite
                    duration: 10000
                    from: 800
                    to: -1*textBrewControl.width
                }
            }
        }
    }

    /**/
}
