import QtQuick 2.0
import QtQuick.Controls 2.2
import QtQuick.Controls.Styles 1.4
import TextFieldDoubleValidator 1.0

Item {
    //id: itemKettle
    //anchors.top: rowControlKettle.top
    //anchors.topMargin: 200
    //width: 200
    //height: 400

    property int xPos
    property int yPos
    property string fontType: "Impact"
    property double temperature
    property double wantedTemperature
    property double liter
    property double currentLiter    //crash if liter is set from Kettle
    property bool wavesVisible: false
    property bool powerActive: false
    property string tempText    
    property int maxLiter: 120
    property int yMaxLiter: 25
    property int yPrevLiter: 215
    property int yCurrentLiter: 25

    onLiterChanged: {
        currentLiter = liter
        console.log("liter is " +currentLiter)

        if(currentLiter<0)
        {
            currentLiter = 0
            console.log("liter set to " +currentLiter)
        }
        else if(currentLiter>120)
        {
            currentLiter = 120
            console.log("liter set to " +currentLiter)
        }

        yCurrentLiter = 215-(((currentLiter|0)/maxLiter)*190)
        console.log("yCurrentLiter: " +yCurrentLiter)
        fillAnimation.restart()
        yPrevLiter = yCurrentLiter//215-(((liter|0)/maxLiter)*190)

        //console.log(yPrevLiter)
    }
    //TODO: add properties for height of water to display water height

    function setEditKettleText()
    {
        if(editKettle.cursorVisible)
        {
            editKettle.text = wantedTemperature
            editKettle.selectAll()
        }
        else
        {
            tempText = editKettle.text.replace(",",".")
            wantedTemperature = parseFloat(tempText)
            editKettle.text = temperature.toString()+" C"
        }
    }

    Image {
        id: imageKettle
        anchors.centerIn: parent
        sourceSize.width: 136
        source: "Pictures/Kettle3.svg"
        z: 3

        //When edited this shall display set temp, else it shall display current temp
        TextField {
            id: editKettle
            x:30
            y: 90
            width: 90
            height: 35
            color: powerActive ? "#ff0000" : "#ffffff"
            text: qsTr(temperature+" C")
            font.family: fontType
            font.bold: true
            background: Rectangle {
                color: "transparent"
            }
            selectionColor: "transparent"
            topPadding: 0
            bottomPadding: 0
            verticalAlignment: Text.AlignBottom
            horizontalAlignment: Text.AlignHCenter
            font.pixelSize: 30
            inputMethodHints: Qt.ImhDigitsOnly
            onCursorVisibleChanged: {
                console.log("cursor visible changed")
                setEditKettleText()
            }
            validator: TextFieldDoubleValidator {
                bottom: 0
                top: 100
                decimals: 1
                notation: "StandardNotation"
            }
        }
        /*TextField {
            id: editKettle
            x:30
            y: 90
            width: 80
            height: 35
            color: powerActive ? "#ff0000" : "#ffffff"
            font.family: fontType
            font.bold: true
            horizontalAlignment: Text.AlignHCenter
            font.pixelSize: 30
            inputMethodHints: Qt.ImhDigitsOnly
            placeholderText: qsTr(temperatureText)

            validator: TextFieldDoubleValidator {
                bottom: 0
                top: 999
                decimals: 0
                notation: "StandardNotation"
            }
            //onPressed: numPad()
        }*/

        Text {
            id: textKettleLiter
            x:30
            y: 135
            width: 80
            height: 35
            color: "#ffffff"
            text: qsTr(currentLiter+" L")
            font.family: fontType
            font.bold: true
            horizontalAlignment: Text.AlignHCenter
            font.pixelSize: 30
        }

        Item
        {
            z: -1
            width: 133
            height: 240
            clip: true
            Rectangle {
                id: wavesKettle
                y: 25
                width: 133
                height: 215
                color: "#ffffff"
                visible: wavesVisible

                NumberAnimation {
                    id: fillAnimation
                    target: wavesKettle
                    property: "y"
                    loops: 1
                    duration: 1000
                    from: yPrevLiter
                    to: yCurrentLiter
                    running: wavesVisible                    
                }

                Image {
                    id: imageWaves
                    width: 133; height: 215
                    source: "Pictures/water.png"
                }
                ShaderEffect {
                    width: 133; height: 215
                    property variant source: imageWaves
                    property real frequency: 8
                    property real amplitude: 0.01
                    property real time: 0.0
                    NumberAnimation on time {
                        from: 0; to: Math.PI*2; duration: 1000; loops: Animation.Infinite
                    }


                    fragmentShader: "
                    varying highp vec2 qt_TexCoord0;
                    uniform sampler2D source;
                    uniform lowp float qt_Opacity;
                    uniform highp float frequency;
                    uniform highp float amplitude;
                    uniform highp float time;
                    void main() {
                        highp vec2 pulse = sin(time - frequency * qt_TexCoord0);
                        highp vec2 coord = qt_TexCoord0 + amplitude * vec2(pulse.x, -pulse.x);
                        gl_FragColor = texture2D(source, coord) * qt_Opacity;
                    }"
                }
            }
        }
    }
}
