pragma ComponentBehavior: Bound

import "variables.js" as Variables
import QtQuick
import QtQuick.Layouts
import Quickshell.Widgets
import Quickshell.Services.SystemTray
import Quickshell.Io
import Quickshell
import QtQuick.Controls
import QtQuick.Effects

MouseArea {
    id: root
    property bool enabled: false
    acceptedButtons: Qt.LeftButton | Qt.RightButton
    hoverEnabled: true
    implicitWidth: 30
    implicitHeight: 30

    onClicked: mouse => {
        if (mouse.button === Qt.LeftButton) {
            enabled = !enabled;
            // console.log(enabled);
        } else {}
    }
    states: [
        State {
            name: "default"
            when: !root.containsMouse
            PropertyChanges {
                target: root
                implicitWidth: 30
                implicitHeight: 30
            }
        },
        State {
            name: "hovered"
            when: root.containsMouse
            PropertyChanges {
                target: root
                implicitWidth: 80
                implicitHeight: 32
            }
        }
    ]
    transitions: Transition {
        ColorAnimation {
            duration: 50
        }
    }
    Behavior on implicitWidth {
        NumberAnimation {
            duration: 100
            easing {
                type: Easing.OutBack
                overshoot: 5
            }
        }
    }
    Behavior on implicitHeight {
        NumberAnimation {
            duration: 100
            easing {
                type: Easing.OutBack
                overshoot: 5
            }
        }
    }

    WrapperRectangle {
        id: trayItemWrapper
        color: !root.containsMouse ? Variables.accent : Variables.surface0
        anchors.fill: parent
        margin: 7
        radius: 20

        Image {
            id: trayIcon
            width: 32
            height: 32
            source: "icons/bell"
            fillMode: Image.PreserveAspectFit
            smooth: true
            mipmap: true
            layer.enabled: root.containsMouse
            layer.effect: MultiEffect {
                brightness: 0.7
            }
        }
    }
}
