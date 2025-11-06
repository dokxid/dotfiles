pragma Singleton

import Quickshell
import Quickshell.Io
import QtQuick

Singleton {
    id: root
    readonly property string time: {
        Qt.formatDateTime(clock.date, "HH:mm:ss");
    }
    readonly property string altValue: {
        Qt.formatDateTime(clock.date, "dddd d.M.yyyy");
    }
    SystemClock {
        id: clock
        precision: SystemClock.Seconds
    }
}
