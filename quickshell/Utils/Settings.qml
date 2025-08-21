pragma Singleton
import Quickshell
import Quickshell.Io

 Singleton {
    id: root

      property real scale: 1.3333; // todo: make this monitor speciifc
      property bool volumeOverdrive: false;
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

      property JsonObject general
      general: JsonObject {
        property bool dimDesktop: true
      }
}
