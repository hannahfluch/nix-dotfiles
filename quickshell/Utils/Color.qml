pragma Singleton

import Quickshell
import QtQuick

Singleton {
    id: root

    // --- Key Colors: These are the main accent colors that define your app's style
    property color mPrimary: defaultColors.mPrimary // prefixed with M to prevent misinterpretation as signals
    property color mOnPrimary: defaultColors.mOnPrimary
    property color mSecondary: defaultColors.mSecondary
    property color mOnSecondary: defaultColors.mOnSecondary
    property color mTertiary: defaultColors.mTertiary
    property color mOnTertiary: defaultColors.mOnTertiary

    // --- Utility Colors: These colors serve specific, universal purposes like indicating errors
    property color mError: defaultColors.mError
    property color mOnError: defaultColors.mOnError

    // --- Surface and Variant Colors: These provide additional options for surfaces and their contents, creating visual hierarchy
    property color mSurface: defaultColors.mSurface
    property color mOnSurface: defaultColors.mOnSurface

    property color mSurfaceVariant: defaultColors.mSurfaceVariant
    property color mOnSurfaceVariant: defaultColors.mOnSurfaceVariant

    property color mOutline: defaultColors.mOutline
    property color mShadow: defaultColors.mShadow

    property color transparent: "transparent"

    // ----------- for locked screen
    function applyOpacity(color, opacity) {
        // Convert color to string and apply opacity
        return color.toString().replace("#", "#" + opacity);
    }

    // --------------------------------
    // Default colors: RosePine
    QtObject {
        id: defaultColors

        property color mPrimary: "#c7a1d8"
        property color mOnPrimary: "#1a151f"

        property color mSecondary: "#a984c4"
        property color mOnSecondary: "#f3edf7"

        property color mTertiary: "#e0b7c9"
        property color mOnTertiary: "#20161f"

        property color mError: "#e9899d"
        property color mOnError: "#1e1418"

        property color mSurface: "#1c1822"
        property color mOnSurface: "#e9e4f0"

        property color mSurfaceVariant: "#262130"
        property color mOnSurfaceVariant: "#a79ab0"

        property color mOutline: "#342c42"
        property color mShadow: "#120f18"
    }
    // todo: Matugen
}
