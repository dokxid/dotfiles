pragma ComponentBehavior: Bound

import "variables.js" as Variables
import QtQuick
import Quickshell.Widgets
import Quickshell.Io
import Quickshell.Hyprland

WrapperMouseArea {
    id: mouseArea
    hoverEnabled: true
    anchors.left: parent.left
    WrapperRectangle {
        id: workspaceWrapper
        color: Variables.accent
        implicitHeight: 30
        margin: 10
        radius: 12
        Process {
            id: notifyProcess
        }
        Row {
            Repeater {
                model: Hyprland.workspaces.values.filter(ws => ws.monitor === Hyprland.focusedMonitor && ws.name.startsWith("special") === false)
                WrapperMouseArea {
                    id: workspaceData
                    required property HyprlandWorkspace modelData
                    hoverEnabled: true
                    onClicked: {
                        if (workspaceData.modelData.focused) {
                            return;
                        }
                        modelData.activate();
                        notifyProcess.exec(["notify-send", "Switching to workspace " + workspaceData.modelData.name]);
                    }
                    WrapperItem {
                        id: workspaceItem
                        leftMargin: 6
                        rightMargin: 6
                        property var isFocused: workspaceData.modelData.focused
                        property var isActive: workspaceData.modelData.active
                        property var isHovered: workspaceData.containsMouse
                        WrapperRectangle {
                            implicitWidth: workspaceItem.isActive ? 30 : 10
                            implicitHeight: 10
                            color: workspaceItem.isHovered 
                            ? Variables.crust 
                            : workspaceItem.isFocused 
                            ? Variables.surface0 
                            : Variables.surface1
                            radius: 6
                            Behavior on implicitWidth {
                                NumberAnimation {
                                    duration: 50
                                    easing.type: Easing.InOutQuad
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}
