import QtQuick 2.9
import QtQuick.Layouts 1.3

Item {
    id: root

    default property list<KeyProperties> keys
    property bool leftHand: false

    property bool pullActive: false

    property int columnCount: 5
    readonly property int rowCount: Math.ceil(keys.length / columnCount)
    property real hSpacing: 10
    property real vSpacing: hSpacing / 2
    property real skew: 20

    signal keyPressed(string keyName)
    signal keyReleased(string keyName)

    implicitWidth: content.width
    implicitHeight: content.height

    function setPressedKeys(keyNames) {
        console.log(keyNames)
        content.setPressedKeys(keyNames)
    }

    ColumnLayout {
        id: content
        spacing: vSpacing
        signal setPressedKeys(var keyNames)
    }

    Component {
        id: buttonRow
        RowLayout {
            spacing: root.hSpacing
        }
    }

    Component {
        id: keyButton
        AngloKey {}
    }

    Component.onCompleted: {
        for(var rowIndex = 0; rowIndex < root.rowCount; ++rowIndex) {
            const innerMargin = (function(r) {
                return Qt.binding(function() { return root.skew * r })
            })(rowIndex)
            const outerMargin = (function(r) {
                return Qt.binding(function() {
                    return root.skew * (root.rowCount - (r+1))
                })
            })(rowIndex)

            var row = buttonRow.createObject(content)
            row.Layout.rightMargin = root.leftHand ? innerMargin : outerMargin
            row.Layout.leftMargin = root.leftHand ? outerMargin: innerMargin

            for(var colIndex = 0; colIndex < root.columnCount; ++colIndex) {
                const keyIndex = (root.columnCount * rowIndex) + colIndex;
                if(keyIndex >= root.keys.length) break

                const props = root.keys[keyIndex]
                const button = keyButton.createObject(row, {
                    'name': props.name,
                    'push': props.push,
                    'pull': props.pull,
                    'pullActive': Qt.binding(function() { return root.pullActive }),
                })
                button.pressedChanged.connect(function(b) {
                    return function() {
                        if(b.pressed) {
                            root.keyPressed(b.name)
                        } else {
                            root.keyReleased(b.name)
                        }
                    }
                }(button))
                content.setPressedKeys.connect(function(b) {
                    return function(keyNames) {
                        b.pressed = (keyNames.indexOf(b.name) != -1)
                    }
                }(button))
            }
        }
    }
}
