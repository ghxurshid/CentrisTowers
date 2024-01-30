import QtQuick 2.9
import QtQuick.Controls 2.4
import QtQuick.Layouts 1.3


Button {
    id: button
    height: 44
    anchors {
        left: parent.left
        right: parent.right
        margins: 10
    }
    checkable: true
    background: Rectangle {
        id: background
        color: "#68B8D1"
        radius: 5
        opacity: 0.8

        states: [
            State {
                name: "pressed"
                PropertyChanges {
                    target: background
                    opacity: 1
                }
                when: button.pressed
            }
        ]

        Behavior on opacity {
            NumberAnimation { duration: 100; easing.type: Easing.Linear }
        }
    }

    indicator: Rectangle {
        id: indicator
        anchors {
            right: parent.right
            bottom: parent.bottom
            margins: 5
        }

        height: 15
        width: 15
        radius: 7
        color: "#333333"

        states: [
            State {
                name: "on"
                PropertyChanges {
                    target: indicator
                    color: "#01FFC1"
                }
                when: button.checked
            }

        ]
    }

    contentItem: Text {
        text: parent.text // Используем текст кнопки
        color: "#CFD8DF"
        font.bold: true
        font.pixelSize: 14
        horizontalAlignment: Text.AlignLeft // Выравнивание текста влево
        verticalAlignment: Text.AlignVCenter // Вертикальное выравнивание по центру
        padding: 10 // Отступы текста от краев кнопки
        elide: Text.ElideRight // Обрезание текста, если он не помещается в кнопку
        width: parent.width // Ширина текста равна ширине родительского элемента (Button)
    }
}



