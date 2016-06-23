import QtQuick 2.2
import Sailfish.Silica 1.0

ApplicationWindow {
    initialPage: Component {
        Page {
            Column {
                id: content
                spacing: Theme.paddingLarge
                anchors.centerIn: parent

                Image
                {
                    id: sglogo
                    anchors.horizontalCenter: parent.horizontalCenter
                    source: "qrc:///res/innogram.png"
                }

                Text {
                    id: name
                    anchors.horizontalCenter: parent.horizontalCenter
                    text: qsTr("Innogram")
                    font.pointSize: 25
                    verticalAlignment: Text.AlignVCenter
                    horizontalAlignment: Text.AlignHCenter
                    color: "white"
                }

                Button {
                    text: qsTr("Start")
                    anchors.horizontalCenter: parent.horizontalCenter
                    //onClicked: pageStack.push(Qt.resolvedUrl("PhonePage.qml"))
                    onClicked: pageStack.push(Qt.resolvedUrl("PhonePage.qml"))
                }

            }
        }
    }
}

