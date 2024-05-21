import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Layouts 1.3

Window { //Apple iPhone 12 Pro, 390 x 844,
    id: win
    width: 390
    height: 844
    visible: true
    title: Qt.application.name

    Flickable {
        anchors.fill: parent

        contentWidth: parent.width
        contentHeight: parent.height

// add JSON to IteamWeather
        ItemWeather {
            id: weather0
            anchors.top: win.bottom
            anchors.horizontalCenter: win.horizontalCenter
        }

    }
}


