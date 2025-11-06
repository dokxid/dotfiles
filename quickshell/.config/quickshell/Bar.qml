import Quickshell
import QtQuick.Layouts
import QtQuick
import Quickshell.Widgets

Scope {

    Variants {
        model: Quickshell.screens

        PanelWindow {
            required property var modelData
            screen: modelData
            color: "transparent"

            anchors {
                top: true
                left: true
                right: true
            }
            height: 50
            RowLayout {
                id: bar
                width: parent.width - 20
                height: 50
                anchors.centerIn: parent
                Rectangle {
                    color: "transparent"
                    Layout.fillHeight: true
                    RowLayout {
                        anchors.fill: parent
                        WrapperItem {
                            HyprWorkspaceWidget {
                                id: hyprWidget
                            }
                        }
                        WrapperItem {
                            HyprClientsWidget {
                                id: hyprClientsWidget
                            }
                        }
                    }
                }
                Rectangle {
                    Layout.fillWidth: true
                }
                Rectangle {
                    color: "transparent"
                    ClockWidget {
                        Layout.fillHeight: true
                        anchors.centerIn: parent
                    }
                }
                Rectangle {
                    Layout.fillWidth: true
                }
                Rectangle {
                    Layout.fillHeight: true
                    color: "transparent"
                }
            }
        }
    }
}
