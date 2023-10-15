import QtQuick.Controls
import DivView

Button {
    icon.width: 20
    icon.height: 20
    anchors.right: parent.right
    anchors.bottom: parent.bottom
    rightPadding: 3
    bottomPadding: 3

    icon.source: "../../icons/resize.svg"
    icon.color: down || checked ? Colors.iconIndicator : Colors.icon

    checkable: false
    display: AbstractButton.IconOnly
    background: null
    onPressed: {
        root.startSystemResize(Qt.BottomEdge | Qt.RightEdge)
    }
}
