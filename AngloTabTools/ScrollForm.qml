import QtQuick 2.9
import QtQuick.Controls 1.4
import QtQuick.Layouts 1.3

ScrollView {
    id: root

    default property alias data: content.data
    readonly property Item contentItem: content

    ColumnLayout {
        width: Math.max(implicitWidth, root.width)

        ColumnLayout {
            id: content
            Layout.margins: 10
            Layout.fillWidth: true
            opacity: enabled ? 1.0 : 0.6
        }
    }
}
