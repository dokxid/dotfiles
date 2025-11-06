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
        width: titleText.paintedWidth + 20
        margin: 10
        radius: 12
        property var toplevel: Hyprland.toplevels.values.filter(tl => tl.activated).pop()
        Text {
            id: titleText
            font.weight: 500
            verticalAlignment: Text.AlignVCenter
            text: workspaceWrapper.toplevel.title
            color: Variables.crust
        }
        Behavior on width {
            NumberAnimation {
                duration: 50
                easing.type: Easing.InOutQuad
            }
        }
    }
}
