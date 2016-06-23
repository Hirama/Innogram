import QtQuick 2.2
import Sailfish.Silica 1.0
import "../model"
//import "../../js/CountryList.js" as CountryList
//import "../../js/TelegramHelper.js" as TelegramHelper

Dialog
{
   // property Context context

    id: dlgphonenumber
    allowedOrientations: defaultAllowedOrientations
    acceptDestinationAction: PageStackAction.Replace
    canAccept: tfphonenumber.text.length > 0

//    acceptDestination: Component {
//        ConnectionPage {
//            context: dlgphonenumber.context
//        }
//    }

    onAccepted: {
        context.telegram.phoneNumber = TelegramHelper.completePhoneNumber(tfcountrycode.text + tfphonenumber.text);
    }

    SilicaFlickable
    {
        anchors.fill: parent
        contentHeight: content.height

        Column
        {
            id: content
            width: parent.width

            Item
            {
                width: parent.width
                height: imglogo.height + lblinfo.contentHeight + (Theme.paddingLarge * 2)

                Image
                {
                    id: imglogo
                    source: "qrc:///res/innogram.png"
                    anchors { top: parent.top; horizontalCenter: parent.horizontalCenter }
                }

                Label
                {
                    id: lblinfo
                    text: qsTr("Write your phone and press 'Next'")
                    font.pixelSize: Theme.fontSizeSmall
                    anchors { left: parent.left; top: imglogo.bottom; right: parent.right; topMargin: Theme.paddingLarge; leftMargin: Theme.paddingMedium; rightMargin: Theme.paddingMedium }
                    horizontalAlignment: Text.AlignHCenter
                    wrapMode: Text.WordWrap
                }
            }

            ComboBox
            {
                id: cbxcountrycodes
                width: parent.width
                label: qsTr("Country Code")

//                menu: ContextMenu {
//                    Repeater {
//                        model: CountryList.countries

//                        MenuItem {
//                            text: CountryList.countries[index].country
//                        }
//                    }
//                }

                onCurrentItemChanged: {
                    tfcountrycode.text = "+" + 7;
                }
            }

            Row
            {

                id: row
                width: parent.width

                TextField
                {
                    id: tfcountrycode
                    width: font.pixelSize * 5
                    inputMethodHints: Qt.ImhNoAutoUppercase | Qt.ImhNoPredictiveText | Qt.ImhDigitsOnly
                }

                TextField
                {
                    id: tfphonenumber
                    width: parent.width - tfcountrycode.width
                    placeholderText: qsTr("Phone Number")
                    inputMethodHints: Qt.ImhNoAutoUppercase | Qt.ImhNoPredictiveText | Qt.ImhDigitsOnly
                }

            }
            Button {
                text: qsTr("Next")
                onClicked: pageStack.replace(Qt.resolvedUrl("AuthPage.qml"))
                  anchors.horizontalCenter: parent.horizontalCenter
                  //onClicked: PageStack._popTransition()
            }
        }
    }
}
