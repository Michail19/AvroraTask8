import QtPositioning 5.3

PositionSource {
    updateInterval: 1000
    nmeaSource: "/usr/share/ru.template.Coordinates/nmea/path.nmea"
    active: true
}
