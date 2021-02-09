import QtQuick 2.9

Item {
    id: root

    property string name: 'X'
    property string push: 'Y0'
    property string pull: 'Z0'
    property bool pullActive: false
    property bool pressed: false

    implicitWidth: implicitHeight
    implicitHeight: pushText.height + pullText.height + 14

    Circle {
        id: button

        readonly property color foreground: root.pressed ? 'white' : 'black'
        readonly property color background: root.pressed ? 'black' : 'white'

        anchors.fill: parent

        color: background
        border.width: 1
        border.color: 'darkGrey'

        Text {
            id: pushText

            anchors.horizontalCenter: parent.horizontalCenter
            anchors.bottom: parent.verticalCenter

            text: root.push
            font.bold: !root.pullActive
            color: root.pullActive ? 'grey' : button.foreground
            horizontalAlignment: Text.AlignHCenter
        }

        Text {
            id: pullText

            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: parent.verticalCenter

            text: root.pull
            font.bold: root.pullActive
            color: root.pullActive ? button.foreground : 'grey'
            horizontalAlignment: Text.AlignHCenter
        }
    }

    MouseArea {
        anchors.fill: parent
        z: 1
        onClicked: root.pressed = !root.pressed
    }
}
