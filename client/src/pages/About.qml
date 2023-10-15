import QtQuick
import QtQuick.Controls.Basic
import DivView

ApplicationWindow {
    id: root
    width: 500
    height: 360
    flags: Qt.Window | Qt.FramelessWindowHint
    color: Colors.surface1

    menuBar: MyMenuBar {
        id: menuBar
        implicitHeight: 20
        rootWindow: root
        infoText: "About"
    }

    Image {
        id: logo
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.margins: 20
        source: "../../icons/qt_logo.svg"
        sourceSize: Qt.size(80, 80)
        fillMode: Image.PreserveAspectFit
        smooth: true
        antialiasing: true
        asynchronous: true
    }

    TextArea {
        anchors.top: logo.bottom
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        anchors.margins: 20
        antialiasing: true
        wrapMode: Text.WrapAnywhere
        color: Colors.textFile
        horizontalAlignment: Text.AlignHCenter
        readOnly: true
        selectionColor: Colors.selection
        text: qsTr("")
        background: Rectangle {
            color: "transparent"
        }
    }
    ResizeButton {}
}
