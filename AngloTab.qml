import QtQuick 2.9
import QtQuick.Controls 1.4
import QtQuick.Layouts 1.3
import MuseScore 3.0
import 'AngloTabTools'

// TODO: React to selection changes
// TODO: Highlight buttons that match selected note
// TODO: Make buttons actually do something

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
                    id: pushBellows
                    text: 'Push'
                    exclusiveGroup: bellowsGroup
                    checked: true
                }
                RadioButton {
                    id: pullBellows
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
                KeyGroup {
                    id: rightHand

                    Layout.margins: 2
                    Layout.alignment: Qt.AlignHCenter

                    leftHand: false
                    pullActive: pullBellows.checked

                    KeyProperties { name: '1a'; push: 'C#5'; pull: 'D#5' }
                    KeyProperties { name: '2a'; push: 'A5';  pull: 'G5' }
                    KeyProperties { name: '3a'; push: 'G#5'; pull: 'A#5' }
                    KeyProperties { name: '4a'; push: 'C#6'; pull: 'D#6' }
                    KeyProperties { name: '5a'; push: 'A6';  pull: 'F6' }
                    KeyProperties { name: '1';  push: 'C5';  pull: 'B4' }
                    KeyProperties { name: '2';  push: 'E5';  pull: 'D5' }
                    KeyProperties { name: '3';  push: 'G5';  pull: 'F5' }
                    KeyProperties { name: '4';  push: 'C6';  pull: 'A5' }
                    KeyProperties { name: '5';  push: 'E6';  pull: 'B5' }
                    KeyProperties { name: '6';  push: 'G5';  pull: 'F#5' }
                    KeyProperties { name: '7';  push: 'B5';  pull: 'A5' }
                    KeyProperties { name: '8';  push: 'D6';  pull: 'C6' }
                    KeyProperties { name: '9';  push: 'G6';  pull: 'E6' }
                    KeyProperties { name: '10'; push: 'B6';  pull: 'F#6' }
                }
            }
        }

        GroupBox {
            Layout.fillWidth: true
            title: 'Left Hand'
            ColumnLayout {
                width: parent.width
                KeyGroup {
                    Layout.margins: 2
                    Layout.alignment: Qt.AlignHCenter

                    leftHand: true
                    pullActive: pullBellows.checked

                    KeyProperties { name: '1a'; push: 'E3';  pull: 'F3' }
                    KeyProperties { name: '2a'; push: 'A3';  pull: 'A#3' }
                    KeyProperties { name: '3a'; push: 'C#4'; pull: 'D#4' }
                    KeyProperties { name: '4a'; push: 'A4';  pull: 'G4' }
                    KeyProperties { name: '5a'; push: 'G#4'; pull: 'A#4' }
                    KeyProperties { name: '1';  push: 'C3';  pull: 'G3' }
                    KeyProperties { name: '2';  push: 'G3';  pull: 'B3' }
                    KeyProperties { name: '3';  push: 'C4';  pull: 'D4' }
                    KeyProperties { name: '4';  push: 'E4';  pull: 'F4' }
                    KeyProperties { name: '5';  push: 'G4';  pull: 'A4' }
                    KeyProperties { name: '6';  push: 'B3';  pull: 'A3' }
                    KeyProperties { name: '7';  push: 'D4';  pull: 'F#4' }
                    KeyProperties { name: '8';  push: 'G4';  pull: 'A4' }
                    KeyProperties { name: '9';  push: 'B4';  pull: 'C5' }
                    KeyProperties { name: '10'; push: 'D5';  pull: 'E5' }
                }
            }
        }

        Item {
            Layout.fillHeight: true
        }
    }
}
