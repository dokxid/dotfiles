pragma ComponentBehavior: Bound

import "variables.js" as Variables
import QtQuick
import QtQuick.Layouts
import Quickshell.Widgets
import Quickshell.Services.SystemTray
import Quickshell.Io
import Quickshell
import QtQuick.Controls

RowLayout {
    id: systemTray
    spacing: 5
    Process {
        id: notifyProcess
    }

    Repeater {
        // model: SystemTray.items
        model: SystemTray.items.values.filter(item => item.id !== "Fcitx")

        MouseArea {
            id: trayItemArea
            required property var modelData
            acceptedButtons: Qt.LeftButton | Qt.RightButton
            hoverEnabled: true
            implicitWidth: 24
            implicitHeight: 24

            onClicked: mouse => {
                if (mouse.button === Qt.LeftButton) {
                    notifyProcess.exec(["notify-send", "category: " + trayItemArea.modelData.category]);
                    modelData.activate();
                } else {
                    if (modelData.hasMenu) {
                        // notifyProcess.exec(["notify-send", "x: " + mouse.x + " y: " + mouse.y]);
                        modelData.display(trayPopup, trayIcon.mapToItem(null, 0, 0).x + mouse.x, trayIcon.mapToItem(null, 0, 0).y + mouse.y);
                    } else {
                        modelData.secondaryActivate();
                    }
                }
            }

            ToolTip {
                id: tooltip
                visible: trayItemArea.containsMouse
                text: trayItemArea.modelData.title + " " + trayItemArea.modelData.id
                delay: 500
            }
            WrapperRectangle {
                id: trayItemWrapper
                color: trayItemArea.containsMouse ? Variables.overlay2 : Variables.surface0
                implicitHeight: 24
                implicitWidth: 24
                radius: 6
                leftMargin: 4
                rightMargin: 4

                IconImage {
                    id: trayIcon
                    implicitWidth: 16
                    implicitHeight: 16
                    source: trayItemArea.modelData.icon ?? ""
                    // source: Quickshell.iconPath("input-keyboard-symbolic", true)
                    smooth: true

                    PopupWindow {
                        id: trayPopup
                        anchor.window: null
                        anchor.rect.x: trayIcon.x
                        anchor.rect.y: trayIcon.y
                        implicitWidth: 500
                        implicitHeight: 500
                        visible: true
                    }
                }
            }
        }
    }
}
