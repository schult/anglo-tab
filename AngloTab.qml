import QtQuick 2.9
import QtQuick.Controls 1.4
import QtQuick.Layouts 1.3
import MuseScore 3.0
import 'AngloTabTools'

MuseScore {
    menuPath: 'Plugins.AngloTab'
    version: '1.0'
    description: 'This plugin provides an interface for creating tablature for 30-button anglo concertina.'

    pluginType: 'dock'
    dockArea: 'right'

    property var cursor: null

    onRun: selectionChanged()

    onScoreStateChanged: {
        if(state.selectionChanged) {
            selectionChanged()
        }
    }

    function selectionChanged() {
        cursor = null

        if(!curScore || curScore.selection.elements.length != 1) {
            form.contentItem.enabled = false
            return
        }

        var element = curScore.selection.elements[0]
        while(element && element.type != Element.SEGMENT) {
            element = element.parent
        }

        if(!element) {
            form.contentItem.enabled = false
            return
        }

        form.contentItem.enabled = true

        const newCursor = curScore.newCursor()
        newCursor.rewindToTick(element.tick)

        if(getPullActive(newCursor)) {
            pullBellows.checked = true
        } else {
            pushBellows.checked = true
        }
        rightHand.setPressedKeys(getKeys(newCursor, Placement.ABOVE))
        leftHand.setPressedKeys(getKeys(newCursor, Placement.BELOW))

        cursor = newCursor
    }

    function getKeys(cursor, placement) {
        if(!cursor) return []
        const keys = []
        const elements = cursor.segment.annotations
        for(var i = elements.length; i--;)
        {
            const element = elements[i]
            if(element.type == Element.STAFF_TEXT &&
                    element.placement == placement) {
                keys.push(element.text)
            }
        }
        return keys
    }

    function getPullActive(cursor) {
        if(!cursor) return false
        const keys = getKeys(cursor, Placement.ABOVE)
        return keys.indexOf('_') != -1
    }

    function clearKeys(cursor, placement) {
        if(!cursor) return
        const elements = cursor.segment.annotations
        for(var i = elements.length; i--;)
        {
            const element = elements[i]
            if(element.type == Element.STAFF_TEXT &&
                    element.placement == placement) {
                removeElement(element)
            }
        }
    }

    function addKey(cursor, keyName, placement) {
        if(!cursor) return

        const keyOrder = [
            '1', '1a', '2', '2a', '3', '3a', '4', '4a', '5', '5a',
            '6', '7', '8', '9', '10', '_'
        ]

        const aboveKeyOrder = function(a, b) {
            return keyOrder.indexOf(a) - keyOrder.indexOf(b)
        }

        const belowKeyOrder = function(a, b) {
            return keyOrder.indexOf(b) - keyOrder.indexOf(a)
        }

        const keys = getKeys(cursor, placement)
        if(keys.indexOf(keyName) == -1) {
            keys.push(keyName)
        }
        keys.sort((placement == Placement.ABOVE) ?
            aboveKeyOrder : belowKeyOrder)

        curScore.startCmd()
        clearKeys(cursor, placement)
        for(var i = 0; i < keys.length; ++i) {
            const text = newElement(Element.STAFF_TEXT)
            text.text = keys[i]
            text.placement = placement
            text.align = Align.BASELINE | Align.HCENTER
            text.offsetX = 0.7
            cursor.add(text)
        }
        curScore.endCmd()
    }

    function removeKey(cursor, keyName, placement) {
        if(!cursor) return
        const elements = cursor.segment.annotations
        curScore.startCmd()
        for(var i = elements.length; i--;)
        {
            const element = elements[i]
            if(element.type == Element.STAFF_TEXT &&
                    element.text == keyName &&
                    element.placement == placement) {
                removeElement(element)
            }
        }
        curScore.endCmd()
    }

    function setPullActive(cursor, pullActive) {
        if(!cursor) return
        if(pullActive) {
            addKey(cursor, '_', Placement.ABOVE)
        } else {
            removeKey(cursor, '_', Placement.ABOVE)
        }
    }

    ScrollForm {
        id: form

        anchors.fill: parent

        FormSection {
            title: 'Bellows Direction'

            ExclusiveGroup { id: bellowsGroup }

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

                onCheckedChanged: setPullActive(cursor, checked)
            }
        }

        FormSection {
            title: 'Right Hand'

            KeyGroup {
                id: rightHand

                Layout.margins: 2
                Layout.alignment: Qt.AlignHCenter

                leftHand: false
                pullActive: pullBellows.checked

                onKeyPressed: addKey(cursor, keyName, Placement.ABOVE)
                onKeyReleased: removeKey(cursor, keyName, Placement.ABOVE)

                KeyProperties { name: '1a'; push: 'C♯5'; pull: 'D♯5' }
                KeyProperties { name: '2a'; push: 'A5';  pull: 'G5' }
                KeyProperties { name: '3a'; push: 'G♯5'; pull: 'A♯5' }
                KeyProperties { name: '4a'; push: 'C♯6'; pull: 'D♯6' }
                KeyProperties { name: '5a'; push: 'A6';  pull: 'F6' }
                KeyProperties { name: '1';  push: 'C5';  pull: 'B4' }
                KeyProperties { name: '2';  push: 'E5';  pull: 'D5' }
                KeyProperties { name: '3';  push: 'G5';  pull: 'F5' }
                KeyProperties { name: '4';  push: 'C6';  pull: 'A5' }
                KeyProperties { name: '5';  push: 'E6';  pull: 'B5' }
                KeyProperties { name: '6';  push: 'G5';  pull: 'F♯5' }
                KeyProperties { name: '7';  push: 'B5';  pull: 'A5' }
                KeyProperties { name: '8';  push: 'D6';  pull: 'C6' }
                KeyProperties { name: '9';  push: 'G6';  pull: 'E6' }
                KeyProperties { name: '10'; push: 'B6';  pull: 'F♯6' }
            }
        }

        FormSection {
            title: 'Left Hand'

            KeyGroup {
                id: leftHand

                Layout.margins: 2
                Layout.alignment: Qt.AlignHCenter

                leftHand: true
                pullActive: pullBellows.checked

                onKeyPressed: addKey(cursor, keyName, Placement.BELOW)
                onKeyReleased: removeKey(cursor, keyName, Placement.BELOW)

                KeyProperties { name: '1a'; push: 'E3';  pull: 'F3' }
                KeyProperties { name: '2a'; push: 'A3';  pull: 'A♯3' }
                KeyProperties { name: '3a'; push: 'C♯4'; pull: 'D♯4' }
                KeyProperties { name: '4a'; push: 'A4';  pull: 'G4' }
                KeyProperties { name: '5a'; push: 'G♯4'; pull: 'A♯4' }
                KeyProperties { name: '1';  push: 'C3';  pull: 'G3' }
                KeyProperties { name: '2';  push: 'G3';  pull: 'B3' }
                KeyProperties { name: '3';  push: 'C4';  pull: 'D4' }
                KeyProperties { name: '4';  push: 'E4';  pull: 'F4' }
                KeyProperties { name: '5';  push: 'G4';  pull: 'A4' }
                KeyProperties { name: '6';  push: 'B3';  pull: 'A3' }
                KeyProperties { name: '7';  push: 'D4';  pull: 'F♯4' }
                KeyProperties { name: '8';  push: 'G4';  pull: 'A4' }
                KeyProperties { name: '9';  push: 'B4';  pull: 'C5' }
                KeyProperties { name: '10'; push: 'D5';  pull: 'E5' }
            }
        }
    }
}
