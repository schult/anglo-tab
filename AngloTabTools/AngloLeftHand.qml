import QtQuick 2.9

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
                    { name: '1a', push: 'E3', pull: 'F3' },
                    { name: '2a', push: 'A3', pull: 'A#3' },
                    { name: '3a', push: 'C#4', pull: 'D#4' },
                    { name: '4a', push: 'A4', pull: 'G4' },
                    { name: '5a', push: 'G#4', pull: 'A#4' }
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
                    { name: '1', push: 'C3', pull: 'G3' },
                    { name: '2', push: 'G3', pull: 'B3' },
                    { name: '3', push: 'C4', pull: 'D4' },
                    { name: '4', push: 'E4', pull: 'F4' },
                    { name: '5', push: 'G4', pull: 'A4' }
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

            Repeater {
                model: [
                    { name: '6', push: 'B3', pull: 'A3' },
                    { name: '7', push: 'D4', pull: 'F#4' },
                    { name: '8', push: 'G4', pull: 'A4' },
                    { name: '9', push: 'B4', pull: 'C5' },
                    { name: '10', push: 'D5', pull: 'E5' }
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
