import QtQuick 2.9

// TODO: Combine with left hand somehow (more generic method to set button layout?)
// TODO: Let others set current selection
// TODO: Emit when selection changes

Item {
    id: root

    property bool pushMode: true

    implicitWidth: column.width
    implicitHeight: column.height

    Column {
        id: column

        spacing: 5

        Row {
            spacing: 10

            Repeater {
                model: [
                    { name: '1a', push: 'C#5', pull: 'D#5' },
                    { name: '2a', push: 'A5', pull: 'G5' },
                    { name: '3a', push: 'G#5', pull: 'A#5' },
                    { name: '4a', push: 'C#6', pull: 'D#6' },
                    { name: '5a', push: 'A6', pull: 'F6' }
                ]
                AngloButton {
                    name: modelData['name']
                    pushNote: modelData['push']
                    pullNote: modelData['pull']
                    pushMode: root.pushMode
                }
            }
        }

        Row {
            spacing: 10

            Item {
                implicitWidth: 10
                implicitHeight: 10
            }

            Repeater {
                model: [
                    { name: '1', push: 'C5', pull: 'B4' },
                    { name: '2', push: 'E5', pull: 'D5' },
                    { name: '3', push: 'G5', pull: 'F5' },
                    { name: '4', push: 'C6', pull: 'A5' },
                    { name: '5', push: 'E6', pull: 'B5' }
                ]
                AngloButton {
                    name: modelData['name']
                    pushNote: modelData['push']
                    pullNote: modelData['pull']
                    pushMode: root.pushMode
                }
            }
        }

        Row {
            spacing: 10

            Item {
                implicitWidth: 10
                implicitHeight: 10
            }

            Item {
                implicitWidth: 10
                implicitHeight: 10
            }

            Repeater {
                model: [
                    { name: '6', push: 'G5', pull: 'F#5' },
                    { name: '7', push: 'B5', pull: 'A5' },
                    { name: '8', push: 'D6', pull: 'C6' },
                    { name: '9', push: 'G6', pull: 'E6' },
                    { name: '10', push: 'B6', pull: 'F#6' }
                ]
                AngloButton {
                    name: modelData['name']
                    pushNote: modelData['push']
                    pullNote: modelData['pull']
                    pushMode: root.pushMode
                }
            }
        }
    }
}
