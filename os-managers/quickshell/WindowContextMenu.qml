pragma ComponentBehavior: Bound

import "variables.js" as Variables
import Quickshell
import QtQuick
import Quickshell.Widgets
import QtQuick.Effects

PopupWindow {
    id: popup
    property var barWindow: null
    property var mouseArea: null
    property var mouseOffset: [0, 0]
    property var itemWidth: 200
    property var itemHeight: 30
    property var itemSpacing: 8
    anchor.window: barWindow
    implicitWidth: itemWidth + 10
    implicitHeight: itemHeight * popupMenuItemInstantiator.count + itemSpacing * (popupMenuItemInstantiator.count - 1) + 10
    anchor.rect.x: barWindow ? mouseArea.mapToItem(barWindow.contentItem, 0, 0).x + mouseOffset[0] - implicitWidth / 2 : 0
    anchor.rect.y: barWindow ? mouseArea.mapToItem(barWindow.contentItem, 0, 0).y + mouseOffset[1] - itemHeight / 2 : 0
    color: "#00000000"
    ListModel {
        id: buttonListModel
        ListElement {
            name: "close"
            tooltip: "close window"
            exec: ""
        }
        ListElement {
            name: "kill"
            tooltip: "close window"
            exec: ""
        }
        ListElement {
            name: "pinfo"
            tooltip: "process information"
            exec: ""
        }
        ListElement {
            name: "wlclient"
            tooltip: "wayland client information"
            exec: ""
        }
    }
    WrapperMouseArea {
        anchors.fill: parent
        hoverEnabled: true
        onExited: {
            popup.visible = false;
        }
        Column {
            spacing: 8
            Repeater {
                id: popupMenuItemInstantiator
                model: buttonListModel
                WrapperMouseArea {
                    id: popupMenuItemMouseArea
                    required property string modelData
                    anchors.horizontalCenter: parent.horizontalCenter
                    implicitWidth: popup.itemWidth + margin
                    implicitHeight: popup.itemHeight + margin
                    hoverEnabled: true
                    propagateComposedEvents: true
                    acceptedButtons: Qt.LeftButton
                    onClicked: event => {}
                    states: [
                        State {
                            name: "default"
                            when: !popupMenuItemMouseArea.containsMouse
                            PropertyChanges {
                                target: popupMenuItemText
                                font.weight: 500
                                font.pixelSize: 11
                            }
                            PropertyChanges {
                                target: popupMenuItemMouseArea
                                margin: 0
                            }
                        },
                        State {
                            name: "hovered"
                            when: popupMenuItemMouseArea.containsMouse
                            PropertyChanges {
                                target: popupMenuItemText
                                font.weight: 600
                                font.pixelSize: 12
                            }
                            PropertyChanges {
                                target: popupMenuItemMouseArea
                                margin: 10
                            }
                        }
                    ]
                    Behavior on implicitWidth {
                        NumberAnimation {
                            duration: 100
                            easing {
                                type: Easing.OutBack
                                overshoot: 2
                            }
                        }
                    }
                    Behavior on implicitHeight {
                        NumberAnimation {
                            duration: 100
                            easing {
                                type: Easing.OutBack
                                overshoot: 2
                            }
                        }
                    }
                    WrapperRectangle {
                        id: popupMenuItemRect
                        anchors.fill: parent
                        color: popupMenuItemMouseArea.containsMouse ? Variables.surface0 : Variables.accent
                        radius: 10
                        Row {
                            leftPadding: 8
                            rightPadding: 8
                            spacing: 8
                            ClippingWrapperRectangle {
                                anchors.verticalCenter: parent.verticalCenter
                                color: "#00000000"
                                Image {
                                    id: popupMenuItemIcon
                                    width: 12
                                    height: 12
                                    source: "icons/edit-delete-symbolic"
                                    layer.enabled: popupMenuItemMouseArea.containsMouse
                                    layer.effect: MultiEffect {
                                        brightness: 0.7
                                    }
                                }
                            }
                            Text {
                                id: popupMenuItemText
                                anchors.verticalCenter: parent.verticalCenter
                                property var itemNameToBeDisplayed: popupMenuItemMouseArea.modelData.tooltip
                                property font popupMenuItemFont: ({
                                        family: "Inter",
                                        weight: 500,
                                        pixelSize: 11,
                                        capitalization: Font.AllLowercase,
                                        verticalAlignment: Text.AlignVCenter
                                    })
                                font: popupMenuItemFont
                                text: itemNameToBeDisplayed ?? "none"
                                color: Variables.crust
                                layer.enabled: popupMenuItemMouseArea.containsMouse
                                layer.effect: MultiEffect {
                                    brightness: 0.7
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}
