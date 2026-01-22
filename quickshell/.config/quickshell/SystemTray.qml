import "variables.js" as Variables
import QtQuick
import Quickshell.Widgets
import Quickshell.Io

WrapperMouseArea {
    id: mouseArea
    hoverEnabled: true
    property bool alternativeText: false
    onEntered: {
        alternativeText = true;
    }
    onClicked: {
        Quickshell.Io.Command.run("ghostty -c wiremix");
    }
    onExited: {
        alternativeText = false;
    }
    WrapperRectangle {
        id: clockWrapper
        color: mouseArea.alternativeText ? Variables.overlay2 : Variables.accent
        implicitHeight: 30
        radius: 12
        leftMargin: 10
        rightMargin: 10
        Text {
            id: clockTime
            verticalAlignment: Text.AlignVCenter
            readonly property font clockFont: ({
                    family: "Jetbrains Mono Nerd Font",
                    pixelSize: 12,
                    bold: true
                })
            font: clockFont
            color: Variables.base
            text: mouseArea.alternativeText ? Time.altValue : Time.time
        }
    }
}
