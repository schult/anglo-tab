import QtQuick 2.9

Item {
    readonly property real diameter: Math.min(width, height)
    property alias color: rect.color
    property alias border: rect.border

    Rectangle {
        id: rect
        anchors.centerIn: parent
        width: diameter
        height: diameter
        radius: diameter / 2
    }
}
