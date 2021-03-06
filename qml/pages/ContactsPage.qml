import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    id: page
    SilicaListView {
        id: listView
        model: 5
        anchors.fill: parent
        header: PageHeader {
            title: qsTr("Contacts")
        }
        delegate: BackgroundItem {
            id: delegate

            Label {
                x: Theme.paddingLarge
                text: qsTr("Item") + " " + index
                anchors.verticalCenter: parent.verticalCenter
                color: delegate.highlighted ? Theme.highlightColor : Theme.primaryColor
            }
            onClicked: console.log("Clicked " + index)
        }
        VerticalScrollDecorator {}
    }

}

