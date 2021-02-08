import QtQuick 2.9

Item {
    property string name: 'X'
    property string pushNote: 'Y0'
    property string pullNote: 'Z0'
    property bool pushMode: true
    property alias color: button.color

    property bool checked: false

    implicitWidth: implicitHeight
    implicitHeight: pushText.height + pullText.height + 14

    Circle {
        id: button

        readonly property color foreground: checked ? 'white' : 'black'
        readonly property color background: checked ? 'black' : 'white'

        anchors.fill: parent

        color: background
        border.width: 1
        border.color: 'darkGrey'

        Text {
            id: pushText

            anchors.horizontalCenter: parent.horizontalCenter
            anchors.bottom: parent.verticalCenter

            text: pushNote
            font.bold: pushMode
            color: pushMode ? button.foreground : 'grey'
            horizontalAlignment: Text.AlignHCenter
        }

        Text {
            id: pullText

            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: parent.verticalCenter

            text: pullNote
            font.bold: !pushMode
            color: pushMode ? 'grey' : button.foreground
            horizontalAlignment: Text.AlignHCenter
        }
    }

    MouseArea {
        anchors.fill: parent
        z: 1

        onClicked: checked = !checked
    }
}
