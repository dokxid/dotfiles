pragma ComponentBehavior: Bound

import Quickshell
import QtQuick.Layouts
import QtQuick
import Quickshell.Widgets

Scope {

    Variants {
        model: Quickshell.screens

        PanelWindow {
            id: root
            required property var modelData
            property bool sidebarEnabled: false
            screen: modelData
            color: "transparent"

            anchors {
                top: true
                left: true
                right: true
            }
            implicitHeight: 50
            Sidebar {
                id: sidebar
                screen: root.modelData
                enabled: root.sidebarEnabled
            }
            Item {
                id: bar
                width: parent.width - 20
                implicitHeight: 50
                anchors.centerIn: parent

                // Left section
                RowLayout {
                    anchors {
                        left: parent.left
                        top: parent.top
                        bottom: parent.bottom
                    }
                    WrapperItem {
                        HyprWorkspaceWidget {
                            id: hyprWidget
                        }
                    }
                    WrapperItem {
                        HyprClientsWidget {
                            id: hyprClientsWidget
                            barWindow: root
                        }
                    }
                }

                // Center section - absolutely positioned
                RowLayout {
                    anchors.centerIn: parent
                    WrapperItem {
                        ClockWidget {
                            id: clockWidget
                        }
                    }
                }

                // Right section (empty for now)
                RowLayout {
                    spacing: 12
                    anchors {
                        right: parent.right
                        top: parent.top
                        bottom: parent.bottom
                    }
                    WrapperItem {
                        SystemTray {
                            id: systemTray
                        }
                    }
                    WrapperItem {
                        SidebarToggle {
                            id: sidebarToggle
                            onEnabledChanged: root.sidebarEnabled = enabled
                        }
                    }
                }
            }
        }
    }
}
