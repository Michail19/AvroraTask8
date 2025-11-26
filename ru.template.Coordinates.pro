TARGET = ru.template.Coordinates

CONFIG += \
    auroraapp

PKGCONFIG += \

SOURCES += \
    src/main.cpp \

HEADERS += \

DISTFILES += \
    rpm/ru.template.Coordinates.spec \

AURORAAPP_ICONS = 86x86 108x108 128x128 172x172

CONFIG += auroraapp_i18n

TRANSLATIONS += \
    translations/ru.template.Coordinates.ts \
    translations/ru.template.Coordinates-ru.ts \

OTHER_FILES += nmea/*
nmea_files.path = /usr/share/$${TARGET}/nmea
nmea_files.files = nmea/*.nmea
INSTALLS += nmea_files

QT += location \
    positioning
