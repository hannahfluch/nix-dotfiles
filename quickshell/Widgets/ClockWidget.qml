import QtQuick
import qs.Services
import qs.Utils
import qs.Widgets

Rectangle {
    id: root

    signal entered
    signal exited
    signal clicked

    width: textItem.paintedWidth
    height: textItem.paintedHeight
    color: Color.transparent

    TextWidget {
        id: textItem
        text: Time.time
        anchors.centerIn: parent
        font.weight: Style.fontWeightBold
    }

    MouseArea {
        id: clockMouseArea
        anchors.fill: parent
        cursorShape: Qt.PointingHandCursor
        hoverEnabled: true
        onEntered: root.entered()
        onExited: root.exited()
        onClicked: root.clicked()
    }
}
