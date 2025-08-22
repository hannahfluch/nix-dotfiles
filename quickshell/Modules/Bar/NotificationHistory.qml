import QtQuick
import Quickshell
import Quickshell.Wayland
import qs.Utils
import qs.Services
import qs.Widgets
PillWidget {
  id: root

  function notificationIcon() {
    if (Settings.data.notifications.suppressed)
        return "notifications_off"
    return "notifications"
  }

  visible: true
  icon: root.notificationIcon()
  iconCircleColor: Color.mPrimary
  collapsedIconColor: Color.mOnSurface
  text: NotificationService.count
  tooltipText: "Notifications: " + NotificationService.count + "\nLeft click for notification history.\nRight click to toggle notification visibility."

  onClicked: mouse => {
    switch (mouse.button) {
            // left button: view history
            case Qt.LeftButton:
                if (!notificationHistoryPanel.active) {
                  // hide existing notifications
                  NotificationService.removeAllNotifications()
                  NotificationService.clearSilenced()

                  notificationHistoryPanel.isLoaded = true
                }
                if (notificationHistoryPanel.item) {
                  if (notificationHistoryPanel.item.visible) {
                    // Panel is visible, hide it with animation
                    if (notificationHistoryPanel.item.hide) {
                      notificationHistoryPanel.item.hide()
                    } else {
                      notificationHistoryPanel.item.visible = false
                    }
                  } else {
                    // Panel is hidden, show it
                    notificationHistoryPanel.item.visible = true
                  }
                }
              break
          // right button: toggle mute
          case Qt.RightButton:
            Settings.data.notifications.suppressed = !Settings.data.notifications.suppressed
            break
   
    }
  }
}
