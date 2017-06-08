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
        MainViewMgr.clock.start()
    }

    function toggleBltPower()
    {
        MainViewMgr.brewery.blt.heaterActive = !MainViewMgr.brewery.blt.heaterActive
    }

    function convertToTime()
    {

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

                /*ControlButton{
                    id: buttonFill
                    Layout.alignment: Qt.AlignCenter
                    buttonText: "FILL"
                    onClicked: {
                        toggleHltPower()
                        kettleHlt.wavesVisible = true
                    }
                }*/

                ControlButton{
                    id: buttonHeat
                    Layout.alignment: Qt.AlignCenter
                    buttonText: "HEAT WATER"
                    onClicked: {
                        //toggleHltPower()
                        //kettleHlt.wavesVisible = true
                    }
                }

                /*ControlButton{
                    id: buttonMash
                    Layout.alignment: Qt.AlignCenter
                    buttonText: "MASH"
                    onClicked: {
                        toggleMltPower()
                        kettleMlt.wavesVisible = true
                    }
                }*/

                /*ControlButton{
                    id: buttonCirculate
                    Layout.alignment: Qt.AlignCenter
                    buttonText: "CIRCULATE"
                    onClicked: {
                        toggleMltPower()
                        kettleMlt.wavesVisible = true
                    }
                }*/

                ControlButton{
                    id: buttonBoil
                    Layout.alignment: Qt.AlignCenter
                    buttonText: "HOPS ADDED"
                    enabled: textBrewControlAnimation.running
                    onClicked: {
                        toggleBltPower()
                        kettleBlt.wavesVisible = true
                    }
                }

                ControlButton{
                    id: buttonCool
                    Layout.alignment: Qt.AlignCenter
                    buttonText: "COOL WORT"
                    onClicked: {
                        toggleBltPower()
                        kettleBlt.wavesVisible = true
                    }
                }
            }
        }

        Item{
            id: itemBrewControlKettle
            //Layout.alignment: Qt.AlignCenter
            Layout.preferredWidth: 800
            Layout.preferredHeight: 300

            RowLayout{
                id: rowBrewControlKettle
                Layout.alignment: Qt.AlignTop
                anchors.fill: parent

                Button {
                    id: image1
                    Layout.minimumWidth: 50
                    anchors.verticalCenter: kettleHlt.verticalCenter
                    anchors.right: kettleHlt.left
                    anchors.verticalCenterOffset: 50
                    checkable: true
                    z: 3
                    background: Image {
                        source: image1.checked ? "Pictures/valveOn.svg" : "Pictures/valveOff.svg"
                        sourceSize.width: 50
                        anchors.centerIn: parent
                    }
                    onClicked: {
                        toggleHltPower()
                        kettleHlt.wavesVisible = true
                    }
                    //TODO animate water?
                }
                Kettle{
                    id: kettleHlt
                    Layout.minimumWidth: 150
                    Layout.minimumHeight: parent.height
                    temperature: MainViewMgr.brewery.hlt.currentTemp
                    wantedTemperature: MainViewMgr.brewery.hlt.wantedTemp
                    liter: myLiter
                    powerActive: MainViewMgr.brewery.hlt.heaterActive
                    onWantedTemperatureChanged: MainViewMgr.brewery.hlt.wantedTemp = wantedTemperature


                }

                Column{
                    id:mashsteps
                    anchors.verticalCenter: kettleHlt.verticalCenter
                    anchors.left: kettleHlt.right

                    Button {
                        id: stepmash
                        Layout.minimumWidth: 100
                        Layout.maximumWidth: 100
                        checkable: true
                        background: Image {
                            source: stepmash.checked ? "Pictures/pumpOn.svg" : "Pictures/pumpOff.svg"
                            sourceSize.width: 100
                            anchors.centerIn: parent
                        }
                        onClicked: {
                            toggleMltPower()
                            kettleMlt.wavesVisible = true
                        }
                        Image{
                           id: pumpBody
                           source: "Pictures/pumpBodyOn.svg"
                           sourceSize.width: 100
                           visible: stepmash.checked
                           anchors.centerIn: stepmash
                           RotationAnimator on rotation {
                                   from: 0;
                                   to: 360;
                                   duration: 1000
                                   loops: Animation.Infinite
                                   running: stepmash.checked
                               }
                        }
                    }

                    Button {
                        id: image2
                        Layout.minimumWidth: 100
                        checkable: true
                        background: Image {
                            source: image2.checked ? "Pictures/pumpOn.svg" : "Pictures/pumpOff.svg"
                            sourceSize.width: 100
                            anchors.centerIn: parent
                        }
                        Image{
                           id: pumpBodyImage2
                           source: "Pictures/pumpBodyOn.svg"
                           sourceSize.width: 100
                           visible: image2.checked
                           anchors.centerIn: image2
                           RotationAnimator on rotation {
                                   from: 0;
                                   to: 360;
                                   duration: 1000
                                   loops: Animation.Infinite
                                   running: image2.checked
                               }
                        }
                    }
                }

                Kettle{
                    id: kettleMlt
                    //Layout.fillWidth: true
                    Layout.minimumWidth: 150
                    Layout.minimumHeight: 300
                    //anchors.verticalCenter: mashsteps.verticalCenter
                    anchors.left: mashsteps.right
                    temperature: MainViewMgr.brewery.mlt.currentTemp
                    wantedTemperature: MainViewMgr.brewery.mlt.wantedTemp
                    liter: 20
                    powerActive: MainViewMgr.brewery.mlt.heaterActive
                    onWantedTemperatureChanged: MainViewMgr.brewery.mlt.wantedTemp = wantedTemperature
                }

                Text{
                    id: timer
                    anchors.verticalCenter: kettleMlt.verticalCenter
                    anchors.left: kettleMlt.right
                    color: "#ffffff"
                    font.family: "Verdana"
                    font.pixelSize: 30
                    text: Math.floor(MainViewMgr.clock.elapsed/1000/60) +":" +Math.floor(MainViewMgr.clock.elapsed/1000%60)
                    visible: true
                }

                /*Button {
                    id: image3
                    Layout.minimumWidth: 100
                    checkable: true
                    z: 3
                    background: Image {
                        source: image3.checked ? "Pictures/pump3.svg" : "Pictures/pump2.svg"
                        sourceSize.width: 100
                        anchors.centerIn: parent
                    }
                }*/

                Kettle{
                    id: kettleBlt
                    //Layout.fillWidth: true
                    Layout.minimumWidth: 150
                    Layout.minimumHeight: 300
                    temperature: MainViewMgr.brewery.blt.currentTemp
                    wantedTemperature: MainViewMgr.brewery.blt.wantedTemp
                    liter: MainViewMgr.brewery.blt.currentLiter
                    powerActive: MainViewMgr.brewery.blt.heaterActive
                    onWantedTemperatureChanged: MainViewMgr.brewery.blt.wantedTemp = wantedTemperature
                }

                /*Button {
                    id: image5
                    Layout.minimumWidth: 100
                    checkable: true
                    z: 3
                    background: Image {
                        source: image5.checked ? "Pictures/pump3.svg" : "Pictures/pump2.svg"
                        sourceSize.width: 100
                        anchors.centerIn: parent
                    }
                }*/
            }
        }

        Item{
            id: itemBrewControlText
            Layout.alignment: Qt.AlignCenter
            Layout.preferredWidth: 800
            Layout.preferredHeight: 60
            clip: true

            /*ControlButton{
                id: buttonHops
                anchors.centerIn: parent
                buttonText: "HOPS ADDED"
                onClicked: {
                    //toggleBltPower()
                    //kettleBlt.wavesVisible = true
                }
            }*/

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
                    id: textBrewControlAnimation
                    loops: Animation.Infinite
                    duration: 10000
                    from: 800
                    to: -1*textBrewControl.width
                    running: !buttonBoil.checked    //This need to go through model
                    alwaysRunToEnd: true
                }
            }
        }
    }

    /**/
}
