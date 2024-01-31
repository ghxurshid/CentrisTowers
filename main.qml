import QtQuick 2.9
import QtQuick.Controls 2.4
import QtQuick.Layouts 1.3
import BluetoothDeviceListModelModule 1.0
import BluetoothLocalDeviceModule 1.0

ApplicationWindow {
    visible: true
    width: 1024
    height: 768
    title: "Modern Window"
    color: "#27282C"

    Item {
        id: left_panel
        objectName: "left-panel"
        anchors {
            fill: parent
            margins: 10
            rightMargin: parent.width - 310
        }
        clip: true
        z: 2

        Model {
            id: listModel
        }

        Column {
            anchors.fill: parent
            anchors.margins: 10
            spacing: 10

            Timer {
                interval: 200
                repeat: true
                running: bluetoothDeviceStatus.localDevice.status === 0
                onTriggered: {
                    bluetoothDeviceStatus.localDevice.sendData(allCommand.checked, randomCommand.checked,
                                                               entranceSwitch.checked, entranceSelect.currentIndex)
                }
            }

            BluetoothDeviceStatus {
                id: bluetoothDeviceStatus
                localDevice: BluetoothLocalDevice {}
                onCustomClicked: {
                    bluetoothDeviceList.state = bluetoothDeviceList.state == "" ? "closed" : ""
                }
            }

            Rectangle {
                height: 2
                color: "#969696"
                anchors {
                    left: parent.left
                    right: parent.right
                }
            }

            CommandButton {
                id: allCommand
                text: qsTr("ALL")
            }

            CommandButton {
                id: randomCommand
                text: qsTr("RANDOM")
            }

            Item {
                height: 44
                anchors {
                    left: parent.left
                    right: parent.right
                    margins: 10
                }

                SelectBox {
                    id: homeSelect
                    model: listModel
                    onCurrentIndexChanged: {
                        floorSelect.model = model.get(currentIndex).floorData
                    }
                }

                SwitchButton {
                    id: homeSwitch
                }
            }

            Item {
                height: 44
                anchors {
                    left: parent.left
                    right: parent.right
                    margins: 10
                }

                SelectBox {
                    id: floorSelect
                    onCurrentIndexChanged: {
                        var lotModel = currentIndex >= 0 ? model.get(currentIndex).lotData : null
                        lotSelect.model = lotModel
                    }
                }

                SwitchButton {
                    id: floorSwitch
                }
            }

            Item {
                height: 44
                anchors {
                    left: parent.left
                    right: parent.right
                    margins: 10
                }

                SelectBox {
                    id: lotSelect
                }

                SwitchButton {
                    id: lotSwitch
                }
            }
        }

        BluetoohDevicesList {
            id: bluetoothDeviceList
            model: BluetoothDeviceListModel {
                id: bluetoothModel

                onSelected: {
                    bluetoothDeviceStatus.localDevice.onSelected(deviceInfo)
                }
            }
            anchors.left: parent.left
            anchors.leftMargin: 16
            anchors.top: parent.top
            anchors.topMargin: 60
        }
    }

    Image {
        fillMode: Image.Stretch
        anchors {
            fill: parent
            margins: 10
        }
        z: 1
        source: "qrc:/img/plan.jpg"
    }
}
