pragma ComponentBehavior: Bound

import "variables.js" as Variables
import QtQuick
import Quickshell.Widgets
import Quickshell.Io
import Quickshell.Hyprland
import Quickshell

WrapperItem {
    id: root
    property var barWindow: null
    WrapperMouseArea {
        id: mouseArea
        readonly property alias popupLoader: popupLoader
        hoverEnabled: true
        anchors.left: parent.left
        acceptedButtons: Qt.LeftButton | Qt.RightButton
        onClicked: event => {
            if (event.button == Qt.RightButton) {
                popupLoader.item.mouseOffset = [event.x, event.y];
                popupLoader.item.visible = true;
            } else {}
        }
        states: [
            State {
                name: "default"
                when: !mouseArea.containsMouse
                PropertyChanges {
                    target: clientsWrapper
                    extraMargin: 0
                }
                PropertyChanges {
                    target: titleText
                    font.weight: 500
                    font.pixelSize: 10
                }
            },
            State {
                name: "hovered"
                when: mouseArea.containsMouse
                PropertyChanges {
                    target: clientsWrapper
                    extraMargin: 10
                }
                PropertyChanges {
                    target: titleText
                    font.weight: 650
                    font.pixelSize: 11
                }
            }
        ]

        WrapperRectangle {
            id: clientsWrapper
            property var titleWidth: Math.min(500, titleText.paintedWidth)
            property var toplevel: Hyprland.toplevels.values.filter(tl => tl.activated).pop()
            anchors.fill: parent
            color: Variables.accent
            implicitHeight: 30 + margin + extraMargin
            margin: 0
            leftMargin: 8
            rightMargin: 8
            implicitWidth: titleWidth + leftMargin + rightMargin + extraMargin
            radius: 12
            clip: true
            states: [
                State {
                    name: "popup_visible"
                    when: popupLoader.active ? popupLoader.item.visible : false
                    PropertyChanges {
                        target: clientsWrapper
                        color: Variables.surface0
                    }
                    PropertyChanges {
                        target: titleText
                        color: Variables.accent
                    }
                },
                State {
                    name: "normal"
                    when: popupLoader.active ? !popupLoader.item.visible : true
                    PropertyChanges {
                        target: clientsWrapper
                        color: Variables.accent
                    }
                    PropertyChanges {
                        target: titleText
                        color: Variables.surface0
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
            Text {
                id: titleText
                property var titleToBeDisplayed: clientsWrapper.toplevel ? clientsWrapper.toplevel.title : ""
                readonly property font windowFont: ({
                        family: "Inter",
                        weight: 500,
                        pixelSize: 10,
                        capitalization: Font.AllLowercase
                    })
                anchors.fill: parent
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                font: windowFont
                text: titleToBeDisplayed.slice(0, 50) ?? "none"
                color: Variables.crust
                Behavior on text {
                    PropertyAnimation {
                        id: animateOpacity
                        target: titleText
                        duration: 400
                        properties: "opacity"
                        from: 0.2
                        to: 1.0
                        easing.type: Easing.OutQuad
                    }
                }
            }
        }
        LazyLoader {
            id: popupLoader
            loading: true
            WindowContextMenu {
                id: windowCtxMenu
                barWindow: root.barWindow
                mouseArea: mouseArea
            }
        }
    }
}
