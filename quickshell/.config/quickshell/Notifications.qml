pragma Singleton
pragma ComponentBehavior: Bound

import Quickshell.Services.Notifications
import Quickshell
import QtQuick

Singleton {
    id: root
    property var list: []

    // NotificationServer {
    //     id: server
    //     keepOnReload: false
    //     actionsSupported: true
    //     bodyHyperlinksSupported: true
    //     bodyImagesSupported: true
    //     bodyMarkupSupported: true
    //     imageSupported: true
    //     persistenceSupported: true
    //
    //     onNotification: notif => {
    //         notif.tracked = true;
    //         const comp = notifComp.createObject(root, {
    //             popup: true,
    //             notification: notif
    //         });
    //         root.list = [comp, ...root.list];
    //     }
    // }
    // Component {
    //     id: notifComp
    //     Notification {}
    // }
}
