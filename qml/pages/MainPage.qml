import QtQuick 2.6
import Sailfish.Silica 1.0

import QtPositioning 5.3
import QtLocation 5.0
import "../assets"

Page {
    NmeaPositionSource { id: positionSource }
    Map {
        id: map
        anchors.fill: parent
        plugin: Plugin {
            name: "webtiles"
            allowExperimental: false

            PluginParameter { name: "webtiles.scheme"; value: "https" }
            PluginParameter { name: "webtiles.host"; value: "tile.openstreetmap.org" }
            PluginParameter { name: "webtiles.path"; value: "/${z}/${x}/${y}.png" }
        }
        gesture.enabled: true
        zoomLevel: zoomSlider.value

        Binding {
           target: map
           property: "center"
           value: positionSource.position.coordinate
           when: positionSource.position.coordinate.isValid
        }
    }
    Slider {
        id: zoomSlider
        anchors {
            left: parent.left
            right: parent.right
            bottom: parent.bottom
        }
        minimumValue: map.minimumZoomLevel
        maximumValue: map.maximumZoomLevel
        value: 11
        highlighted: true
        handleVisible: true
    }
    Component {
        id: mapQuickCircleComponent

        MapQuickCircle { }
    }
    Footprints {
        id: footprints
        visible: positionSource.position.coordinate.isValid
        coordinate: positionSource.position.coordinate
        diameter: Math.min(map.width, map.height) / 8
    }

    Component.onCompleted: map.addMapItem(footprints)
}
