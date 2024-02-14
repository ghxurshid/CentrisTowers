import QtQuick 2.9
import QtQuick.Controls 2.4
import QtQuick.Layouts 1.3
import QtGraphicalEffects 1.0
import BluetoothLocalDeviceModule 1.0

Row {
    id: row
    spacing: 10
    anchors {
        left: parent.left
        right: parent.right
        margins: 10
    }

    signal customClicked()
    property BluetoothLocalDevice localDevice

    Item {
        width: parent.width * 0.75
        height: 50

        Rectangle {
            anchors {
                centerIn: parent
                fill: parent
                topMargin: 5
                bottomMargin: 5
            }
            color: "#2A333A"
            border.width: 1
            border.color: "#232A30"
            radius: 3

            gradient: Gradient {
                GradientStop { position: 0.0; color: "#323B42" } // Начальный цвет
                GradientStop { position: 1.0; color: "#232A30" } // Конечный цвет
            }

            layer.enabled: true
            layer.effect: DropShadow {
                transparentBorder: true
                radius: 2.0
                samples: 1 + radius * 2
                spread: 0.3
            }

            MouseArea {
                anchors.fill: parent
                onClicked: row.customClicked()
            }
        }

        Text {
            id: statusText
            text: localDevice.name
            color: localDevice.status === 0 ? "#00C61A" : "#CFD8DF"
            font.bold: true
            font.pixelSize: 14
            horizontalAlignment: Text.AlignLeft // Выравнивание текста влево
            verticalAlignment: Text.AlignVCenter // Вертикальное выравнивание по центру
            padding: 10 // Отступы текста от краев кнопки
            elide: Text.ElideRight // Обрезание текста, если он не помещается в кнопку
            width: parent.width // Ширина текста равна ширине родительского элемента (Button)
            anchors {
                left: parent.left
                leftMargin: 10
                verticalCenter: parent.verticalCenter
            }
        }
    }

    Item {
        width: 50
        height: 50

        RoundButton {
            id: button
            height: 50
            width: 50
            anchors.centerIn: parent
            background: Image {
                id: backgroundImage
                anchors.fill: parent
                source: "qrc:/assets/icons/bluetooth_disabled.png"
            }
            scale: pressed ? 1.1 : 1

            Behavior on scale {
                NumberAnimation { duration: 100; easing.type: Easing.Linear }
            }

            onClicked: {
                localDevice.buttonClick()
            }

            states: [
                State {
                    name: "disabled"
                    PropertyChanges {
                        target: backgroundImage
                        source: "qrc:/assets/icons/bluetooth_disabled.png"
                        opacity: 1
                    }
                    when: localDevice.status === 2
                },
                State {
                    name: "connecting"
                    PropertyChanges {
                        target: backgroundImage
                        source: "qrc:/assets/icons/bluetooth_connecting.png"
                    }
                    when: localDevice.status === 1

                },
                State {
                    name: "enabled"
                    PropertyChanges {
                        target: backgroundImage
                        source: "qrc:/assets/icons/bluetooth_enabled.png"
                        opacity: 1
                    }
                    when: localDevice.status === 0
                }
            ]

            SequentialAnimation {
                running: localDevice.status === 1
                loops: Animation.Infinite

                NumberAnimation {
                    target: backgroundImage
                    property: "opacity"
                    to: 0.4
                    duration: 800
                }

                NumberAnimation {
                    target: backgroundImage
                    property: "opacity"
                    to: 1
                    duration: 800
                }
            }
        }
    }
}
