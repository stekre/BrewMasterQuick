import QtQuick 2.0

Item {
    id: itemKettle
    //anchors.top: rowControlKettle.top
    //anchors.topMargin: 200
    //width: 200
    //height: 400

    property int xPos
    property int yPos
    property string temperatureText
    property string literText
    property bool wavesVisible: false
    //TODO: add properties for height of water to display water height

    Image {
        id: imageKettle
        anchors.centerIn: parent
        sourceSize.width: 136
        source: "Pictures/Kettle3.svg"
        z: 3

        TextEdit {
            id: editKettle
            x:30
            y: 90
            width: 80
            height: 35
            color: "#ffffff"
            text: qsTr(temperatureText)
            font.bold: true
            font.weight: Font.ExtraLight
            horizontalAlignment: Text.AlignHCenter
            font.pixelSize: 30
        }

        Text {
            id: textKettleLiter
            x:30
            y: 135
            width: 80
            height: 35
            color: "#ffffff"
            text: qsTr(literText)
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
                    duration: 10000
                    from: 215
                    to: 25
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
