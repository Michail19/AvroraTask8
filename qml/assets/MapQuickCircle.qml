import QtQuick 2.6
import QtLocation 5.0

MapQuickItem {
    property alias diameter: rectangle.width
    property alias color: rectangle.color

    sourceItem: Rectangle {
        id: rectangle
        height: width
        radius: width / 2
    }
    anchorPoint {
        x: sourceItem.width / 2
        y: sourceItem.height / 2
    }
}
