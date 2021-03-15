pragma Singleton

import QtQuick 2.9
import '..'

Item {
    property alias rightHand: rh.keys
    property alias leftHand: lh.keys
    KeyPropList {
        id: 'rh'
        KeyProperties { name: '1a'; push: 'D♯5'; pull: 'C♯5' }
        KeyProperties { name: '2a'; push: 'C♯5'; pull: 'D♯5' }
        KeyProperties { name: '3a'; push: 'G♯5'; pull: 'G5' }
        KeyProperties { name: '4a'; push: 'C♯6'; pull: 'A♯5' }
        KeyProperties { name: '5a'; push: 'A5';  pull: 'D6' }
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

    KeyPropList {
        id: 'lh'
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
