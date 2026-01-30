pragma ComponentBehavior: Bound

import "variables.js" as Variables
import Quickshell
import Quickshell.Widgets
import QtQuick
import Quickshell.Io

PanelWindow {
    id: root
    required property bool enabled
    onEnabledChanged: {
        console.log("sidebar: " + enabled);
    }
    anchors {
        right: true
        bottom: true
        top: true
    }
    Behavior on implicitWidth {
        NumberAnimation {
            duration: 20
            easing {
                type: Easing.OutQuint
            }
        }
    }
    WrapperRectangle {
        id: background
        states: [
            State {
                name: "off"
                when: !root.enabled
                PropertyChanges {
                    root.implicitWidth: 0
                }
            },
            State {
                name: "on"
                when: root.enabled
                PropertyChanges {
                    root.implicitWidth: 400
                }
            }
        ]

        // Text {
        //     anchors.centerIn: parent
        //     text: "Hello!"
        // }
    }
}
