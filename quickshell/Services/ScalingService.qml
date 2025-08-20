pragma Singleton

import Quickshell

Singleton {
    id: root
    // -------------------------------------------
    // Dynamic scaling based on resolution

    // Design reference resolution (for scale = 1.0)
    // readonly property int designScreenWidth: 2560
    // readonly property int designScreenHeight: 1440

    // Design reference resolution (for scale = 1.3)
    readonly property int designScreenWidth: 1969
    readonly property int designScreenHeight: 1107

    function dynamic(aScreen) {
        var ratioW = aScreen.width / designScreenWidth;
        var ratioH = aScreen.height / designScreenHeight;
        return Math.min(ratioW, ratioH);
    }
}
