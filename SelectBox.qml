import QtQuick 2.9
import QtQuick.Controls 2.4
import QtQuick.Layouts 1.3
import QtGraphicalEffects 1.0

ComboBox {
    id: selectBox
    anchors.fill: parent
    anchors.rightMargin: parent.width * 0.20
    background: Rectangle {
        anchors.fill: selectBox
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
    }

    contentItem: Text {
        text: parent.currentText
        color: "#CFD8DF"
        font.bold: true
        font.pixelSize: 16
        horizontalAlignment: Text.AlignLeft // Выравнивание текста влево
        verticalAlignment: Text.AlignVCenter // Вертикальное выравнивание по центру
        padding: 10 // Отступы текста от краев кнопки
        elide: Text.ElideRight // Обрезание текста, если он не помещается в кнопку
        width: parent.width // Ширина текста равна ширине родительского элемента (Button)
    }

    indicator: Item {
        width: parent.height
        height: parent.height
        anchors.right: parent.right

        Image {
            anchors.fill: parent
            anchors.margins: 14
            source: "qrc:/assets/icons/combobox_icon.png"
        }
    }
    //        delegate: Item {
    //            width: parent.width
    //            height: 40
    //            Text {
    //                anchors.centerIn: parent
    //                text: model.text // Обращение к свойству text напрямую из ListModel
    //            }
    //            MouseArea {
    //                anchors.fill: parent
    //                onClicked: {
    //                    parent.currentText = model.text
    //                }
    //            }
    //        }

}



