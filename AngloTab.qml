import QtQuick 2.9
import QtQuick.Controls 1.4
import QtQuick.Layouts 1.3
import MuseScore 3.0
import 'AngloTabTools'

// TODO: React to selection changes
// TODO: Highlight buttons that match selected note
// TODO: Make buttons actually do something
// TODO: Add "prev/next note" buttons? Or are there already shortcuts for that?

MuseScore {
    menuPath:   'Plugins.AngloTab'
    version:  '1.0'
    description: 'This plugin provides an interface for creating tablature for 30-button anglo concertina.'

    pluginType: 'dock'
    dockArea:   'right'

    ColumnLayout {
        id: content
        anchors.fill: parent
        anchors.margins: 10

        GroupBox {
            Layout.fillWidth: true
            title: 'Bellows Direction'
            ExclusiveGroup { id: bellowsGroup }
            ColumnLayout {
                RadioButton {
                    id: pushMode
                    text: 'Push'
                    checked: true
                    exclusiveGroup: bellowsGroup
                }
                RadioButton {
                    text: 'Pull'
                    exclusiveGroup: bellowsGroup
                }
            }
        }

        GroupBox {
            Layout.fillWidth: true
            title: 'Right Hand'
            ColumnLayout {
                width: parent.width
                AngloRightHand {
                    Layout.margins: 2
                    Layout.alignment: Qt.AlignHCenter
                    pushMode: pushMode.checked
                }
            }
        }

        GroupBox {
            Layout.fillWidth: true
            title: 'Left Hand'
            ColumnLayout {
                width: parent.width
                AngloLeftHand {
                    Layout.margins: 2
                    Layout.alignment: Qt.AlignHCenter
                    pushMode: pushMode.checked
                }
            }
        }

        Item {
            Layout.fillHeight: true
        }
    }
}
