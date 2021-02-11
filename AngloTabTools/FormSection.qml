import QtQuick 2.9
import QtQuick.Controls 1.4
import QtQuick.Layouts 1.3

GroupBox {
    id: root

    default property alias data: content.data

    Layout.fillWidth: true

    ColumnLayout {
        id: content
        width: parent.width
    }
}
