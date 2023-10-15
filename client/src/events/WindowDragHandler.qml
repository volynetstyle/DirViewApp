import QtQuick
import QtQuick.Controls

DragHandler {
    required property ApplicationWindow dragWindow
    target: null
    onActiveChanged: {
       if (active) dragWindow.startSystemMove()
    }
}
