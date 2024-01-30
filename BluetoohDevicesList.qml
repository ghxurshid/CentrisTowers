import QtQuick 2.11
import QtQuick.Controls 2.4
import BluetoothDeviceListModelModule 1.0

ListView {
    id: listView

    width: 260
    height: 400
    clip: true
    state: "closed"

    headerPositioning: ListView.OverlayFooter
    footerPositioning: ListView.OverlayFooter

    Rectangle {
        id: background
        color: "#292F3F"
        radius: 10
        anchors.fill: parent
        z: -1
    }

    header: Rectangle {
        id: header
        height: 40
        width: parent.width
        color: "#292F3F"
        radius: 10
        z: 2

        Text {
            id: headerText
            color: "#FCFFFF"
            text: qsTr("Bluetooth")
            font.bold: true
            font.pointSize: 10

            anchors {
                left: parent.left
                leftMargin: 10
                verticalCenter: parent.verticalCenter
            }
        }

        SwitchButton {
            anchors {
                right: parent.right
                verticalCenter: parent.verticalCenter
            }
        }

        Rectangle {
            height: 2
            color: "#2D78D5"
            width: 50
            anchors {
                left: parent.left
                bottom: parent.bottom
            }
        }
    }

    delegate: Item {
        width: parent.width
        height: 44
        z: 1

        Item {
            id: iconSection
            height: 40
            width: 40
            anchors.verticalCenter: parent.verticalCenter
            anchors.left: parent.left
            anchors.leftMargin: 5

            Image {
                anchors.centerIn: parent
                height: 20
                width: 20
                source: "qrc:/img/bluetooth_icon.png"
            }
        }

        Text {
            id: name
            text: model.name !== "" ? model.name : model.address
            color: "white"
            elide: Text.ElideRight
            anchors {
                top: parent.top
                left: iconSection.right
                right: rssi.left
                topMargin: 5
                rightMargin: 5
            }
            font {
                pixelSize: 14
                bold: true
            }
        }

        Text {
            id: address
            text: model.address
            color: "white"
            visible: model.name !== ""
            anchors {
                left: iconSection.right
                right: rssi.left
                bottom: parent.bottom
                rightMargin: 5
                bottomMargin: 5

            }
            font {
                pixelSize: 12
                italic: true
            }
        }

        Text {
            id: rssi
            text: model.rssi + " dBm"
            color: "white"
            anchors {
                right: parent.right
                verticalCenter: parent.verticalCenter
                rightMargin: 15
            }
            font {
                pixelSize: 16
                bold: true
            }
        }
        MouseArea {
            anchors.fill: parent

            onClicked: {
                listView.model.select(model.index)
                listView.state = "closed"
            }
        }
    }

    footer: Item {
        id: footer
        height: 44
        width: parent.width
        z: 2

        Rectangle {
            height: parent.height + 10
            width: parent.width
            anchors.bottom: parent.bottom
            color: "#2B2E35"
            radius: 10

            Text {
                id: footerText
                text: qsTr("More Bluetooth settings")
                color: "#2D78D5"
                anchors {
                    left: parent.left
                    leftMargin: 10
                    verticalCenter: parent.verticalCenter
                }
            }
        }
    }

    states: [
        State {
            name: "closed"
            PropertyChanges {
                target: listView
                height: 0
            }
        }
    ]

    Behavior on height {
        NumberAnimation { duration: 600; easing.type: Easing.OutQuart }
    }
}
