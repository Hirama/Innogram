import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    id: page

    SilicaFlickable {
        anchors.fill: parent
        contentHeight: column.height

        Image
        {
            id: sglogo
            anchors.horizontalCenter: parent.horizontalCenter
            source: "qrc:///res/telegram.png"
        }

        Column {
            id: column

            width: page.width
            spacing: Theme.paddingLarge
            PageHeader {
                title: qsTr("About")
            }
            Text {
                color: "white"
                text: "This is unofficial Telegram App"
            }
            Text {
                color: "white"
                text: "For feedback send e-mail on"
            }
            Text {
                color: "white"
                text: "a.zolin@innopolis.ru"
            }
        }
    }
}

