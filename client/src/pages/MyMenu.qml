import QtQuick
import QtQuick.Controls.Basic
import DivView

Menu {
    id: root

    background: Rectangle {
        implicitWidth: 200
        implicitHeight: 40
        color: Colors.surface2
    }

    delegate: MenuItem {
        id: menuItem
        implicitWidth: 200
        implicitHeight: 40
        contentItem: Item {
            Text {
                anchors.verticalCenter: parent.verticalCenter
                anchors.left: parent.left
                anchors.leftMargin: 5
                text: menuItem.text
                color: enabled ? Colors.text : Colors.disabledText
            }
            Rectangle {
                anchors.verticalCenter: parent.verticalCenter
                anchors.right: parent.right
                width: 6
                height: parent.height
                visible: menuItem.highlighted
                color: Colors.color2
            }
        }
        background: Rectangle {
            color: menuItem.highlighted ? Colors.active : "transparent"
        }
    }
}
