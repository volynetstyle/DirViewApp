import QtQuick
import QtQuick.Layouts
import QtQuick.Controls.Basic
import DivView

Rectangle {
    id: root
    color: Colors.surface2

    required property ApplicationWindow rootWindow
    property alias currentTabIndex: tabBar.currentIndex

    ColumnLayout {
        anchors.fill: root
        anchors.topMargin: 10
        anchors.bottomMargin: 10
        spacing: 10

        Container {
            id: tabBar
            Layout.fillWidth: true

            ButtonGroup {
                buttons: tabBar.contentItem.children
                onCheckedButtonChanged: tabBar.setCurrentIndex(Math.max(0, buttons.indexOf(checkedButton)))
            }

            contentItem: ColumnLayout {
                spacing: tabBar.spacing

                Repeater {
                    model: tabBar.contentModel
                }
            }

            component SidebarEntry: Button {
                id: sidebarButton
                icon.color: down || checked ? Colors.iconIndicator : Colors.icon
                icon.width: 35
                icon.height: 35
                leftPadding: 8 + indicator.width
                background: null

                Rectangle {
                    id: indicator
                    x: 4
                    anchors.verticalCenter: parent.verticalCenter
                    width: 4
                    height: sidebarButton.icon.width
                    color: Colors.color1
                    visible: sidebarButton.checked
                }
            }

            SidebarEntry {
                icon.source: "../../icons/light_bulb.svg"
                checkable: true
                checked: true
                Layout.alignment: Qt.AlignHCenter
            }

            SidebarEntry {
                icon.source: "../../icons/read.svg"
                checkable: true
                Layout.alignment: Qt.AlignHCenter
            }
        }

        Item {
            Layout.fillHeight: true
            Layout.fillWidth: true
            WindowDragHandler { dragWindow: rootWindow }
        }

        SidebarEntry {
            id: qtWebsiteButton
            icon.source: "../../icons/globe.svg"
            checkable: false
            onClicked: Qt.openUrlExternally("https://www.qt.io/")
        }

        SidebarEntry {
            id: aboutQtButton
            icon.source: "../../icons/info_sign.svg"
            checkable: false
            onClicked: aboutQtWindow.visible = !aboutQtWindow.visible
        }
    }

    About {
        id: aboutQtWindow
        visible: false
    }
}
