pragma Singleton
import Quickshell
import Quickshell.Io

 Singleton {
    id: root
    
      // Bar config
      property JsonObject bar

      bar: JsonObject {
        property bool top: true
        property bool showActiveWindow: true
        property bool showSystemInfo: false
        property bool showMedia: false
        property bool showBrightness: true
        property bool showNotificationsHistory: true
        property bool showTray: true
        property real backgroundOpacity: 1.0
        property list<string> monitors: []
      }
}
