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

//            Timer {
//                interval: 200
//                repeat: true
//                running: bluetoothDeviceStatus.localDevice.status === 0
//                onTriggered: {
//                    bluetoothDeviceStatus.localDevice.sendData(allCommand.checked, randomCommand.checked,
//                                                               homeSwitch.checked, floorSwitch.checked, lotSwitch.checked,
//                                                               homeSelect.currentIndex, floorSelect.currentIndex, lotSelect.currentIndex)
//                }
//            }

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
                onClicked: {
                    if (allCommand.checked) {
                        bluetoothDeviceStatus.localDevice.sendData2("W1")
                    } else {
                        bluetoothDeviceStatus.localDevice.sendData2("W0")
                    }
                }
            }

            CommandButton {
                id: randomCommand
                text: qsTr("RANDOM")

                onClicked: {
                    if (randomCommand.checked) {
                        bluetoothDeviceStatus.localDevice.sendData2("Z1")
                    } else {
                        bluetoothDeviceStatus.localDevice.sendData2("Z0")
                    }
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

                        if (currentIndex > 0 && lotModel.count === 0) {
                            bluetoothDeviceStatus.localDevice.sendData2(model.get(currentIndex).command)
                        }
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
                    onCurrentIndexChanged: {
                        if (currentIndex > 0) {
                            bluetoothDeviceStatus.localDevice.sendData2(model.get(currentIndex).command)
                        }
                    }
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

    /*Image {
        anchors {
            top: parent.top
            right: parent.right
            bottom: parent.bottom
            left: left_panel.right
            margins: 10
        }
        z: 1
        source: lotSelect.currentIndex > 0 ? lotSelect.model.get(lotSelect.currentIndex).image :
                floorSelect.currentIndex > 0 ? floorSelect.model.get(floorSelect.currentIndex).image :
                homeSelect.currentIndex > 0 ? homeSelect.model.get(homeSelect.currentIndex).image :  "../assets/images/plan.jpg"
    }*/
    Item {
        anchors {
            top: parent.top
            right: parent.right
            bottom: parent.bottom
            left: left_panel.right
            margins: 10
        }
        clip: true

        Image {
            id: image
            anchors.fill: parent
            fillMode: Image.PreserveAspectFit
            visible: floorSelect.currentIndex > 0
            source: lotSelect.currentIndex > 0 ? lotSelect.model.get(lotSelect.currentIndex).image :
                    floorSelect.currentIndex > 0 ? floorSelect.model.get(floorSelect.currentIndex).image :
                    homeSelect.currentIndex > 0 ? homeSelect.model.get(homeSelect.currentIndex).image : ""
        }

        PathView {
            id: pathView
            anchors.fill: parent
            visible: !(floorSelect.currentIndex > 0)
            model: ListModel {
                id: imageModel
                ListElement { source: "assets:/slayds/IMG_7508.JPG" }
                ListElement { source: "assets:/slayds/IMG_7512.JPG" }
                ListElement { source: "assets:/slayds/IMG_7519.JPG" }
                ListElement { source: "assets:/slayds/IMG_7522.JPG" }
                ListElement { source: "assets:/slayds/IMG_7525.JPG" }
                ListElement { source: "assets:/slayds/IMG_7529.JPG" }
                ListElement { source: "assets:/slayds/IMG_7534.JPG" }

//                ListElement { source: "file:/WorkPath/QT/CentrisTowers/src/resources/assets/slayds/IMG_7508.JPG" }
//                ListElement { source: "file:/WorkPath/QT/CentrisTowers/src/resources/assets/slayds/IMG_7512.JPG" }
//                ListElement { source: "file:/WorkPath/QT/CentrisTowers/src/resources/assets/slayds/IMG_7519.JPG" }
//                ListElement { source: "file:/WorkPath/QT/CentrisTowers/src/resources/assets/slayds/IMG_7522.JPG" }
//                ListElement { source: "file:/WorkPath/QT/CentrisTowers/src/resources/assets/slayds/IMG_7525.JPG" }
//                ListElement { source: "file:/WorkPath/QT/CentrisTowers/src/resources/assets/slayds/IMG_7529.JPG" }
//                ListElement { source: "file:/WorkPath/QT/CentrisTowers/src/resources/assets/slayds/IMG_7534.JPG" }

//                ListElement { source: "file:/WorkPath/QT/CentrisTowers/src/resources/assets/images/C-2.jpg" }
//                ListElement { source: "file:/WorkPath/QT/CentrisTowers/src/resources/assets/images/C-3.jpg" }
//                ListElement { source: "file:/WorkPath/QT/CentrisTowers/src/resources/assets/images/C-4.jpg" }
//                ListElement { source: "file:/WorkPath/QT/CentrisTowers/src/resources/assets/images/C-5.jpg" }
//                ListElement { source: "file:/WorkPath/QT/CentrisTowers/src/resources/assets/images/C-6.jpg" }
//                ListElement { source: "file:/WorkPath/QT/CentrisTowers/src/resources/assets/images/C-7.jpg" }
//                ListElement { source: "file:/WorkPath/QT/CentrisTowers/src/resources/assets/images/C-8.jpg" }
//                ListElement { source: "file:/WorkPath/QT/CentrisTowers/src/resources/assets/images/C-9.jpg" }

            }
            delegate: Image {
                width: pathView.width
                height: pathView.height
                fillMode: Image.PreserveAspectFit
                source: model.source
                opacity: PathView.isCurrentItem ? 1 : 0
                z: PathView.isCurrentItem ? 1 : 0

                Behavior on opacity {
                    NumberAnimation {
                        id: fadeAnimation
                        duration: 400 // Длительность анимации перехода
                    }
                }
            }

            pathItemCount: imageModel.count // Устанавливаем количество элементов в списке равным количеству изображений
            preferredHighlightBegin: 0.5
            preferredHighlightEnd: 0.5

            path: Path {
                startX: pathView.width / 2;        startY: - pathView.height / 2
                PathLine { x: -   pathView.width / 2;     y: - pathView.height / 2; }
                PathLine { x: -   pathView.width / 2;     y:   pathView.height / 2; }
                PathLine { x: 3 * pathView.width / 2;     y:   pathView.height / 2; }
                PathLine { x: 3 * pathView.width / 2;     y: - pathView.height / 2; }
                PathLine { x:     pathView.width / 2;     y: - pathView.height / 2; }
            }

            Timer {
                id: slideshowTimer
                interval: 3000 // Интервал переключения между изображениями (в миллисекундах)
                running: true
                repeat: true
                onTriggered: {
                    var nextIndex = (pathView.currentIndex + 1) % imageModel.count
                    pathView.incrementCurrentIndex()
                }
            }
        }
    }
}
