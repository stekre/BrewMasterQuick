import QtQuick 2.0
import QtQuick.Controls 2.2
import QtQuick.VirtualKeyboard 2.1
import QtQuick.VirtualKeyboard.Settings 2.1

/**/
InputPanel {
    //property int cIndex: view.currentIndex

    id: keyboard;
    y: parent.height
    anchors.left: parent.left
    anchors.right: parent.right
    z: 3


    /*Component.onCompleted: {
        VirtualKeyboardSettings.stylename = "test"
        console.log(VirtualKeyboardSettings.styleName)
    }*/

    onActiveChanged: {
        if(!active)
        {
            forceActiveFocus()
            console.log("Keyboard closed")
        }
    }

    states:[
        State {
            name: "visible";
            when: keyboard.active;
            PropertyChanges {
                target: keyboard;
                // position the top of the keyboard to the bottom of the text input field
                y: {
                    if(view.currentIndex == 0)
                    {
                        90
                    }
                    else
                    {
                        parent.height/2
                    }
                    //A hack to set position based on a text input InputMethodHints
                    /*if(InputContext.inputMethodHints == 0)
                {
                    90
                }
                else
                {
                    parent.height/2
                }*/
                }
            }
        }
    ]

    //x: (parent.width/2)-(width/2)
    //y: (parent.height/2)-(height/2)
    //y: screenHeight; // position the top of the keyboard to the bottom of the screen/display

    /*anchors.left: parent.left;
    anchors.right: parent.right;

    states: State {
        name: "visible";
        when: keyboard.active;
        PropertyChanges {
            target: keyboard;
            // position the top of the keyboard to the bottom of the text input field
            y: textInput.height;
        }
    }
    transitions: Transition {
        from: ""; // default initial state
        to: "visible";
        reversible: true; // toggle visibility with reversible: true;
        ParallelAnimation {
            NumberAnimation {
                properties: "y";
                duration: 250;
                easing.type: Easing.InOutQuad;
            }
        }
    }*/
}

/*Dialog {
    //title: "Input Number"
    height: 150
    width: 300
    x: (parent.width/2)-(width/2)
    y: (parent.height/2)-(height/2)
    //standardButtons: StandardButton.Ok | StandardButton.Cancel

    Column {
        anchors.fill: parent


        //        TextField {
        //            id: digitsField

        //            width: parent.width
        //            //previewText: "Digits only field"
        //
        //            enterKeyAction: EnterKeyAction.Next
        //            onEnterKeyClicked: textArea.focus = true
        //        }
        //        TextField {
        //            id: newFolderInput
        //            width: parent.width * 0.75
        //            focus: true
        //            onFocusChanged: console.log("Focus changed " + focus)
        //        }
    }
}*/

