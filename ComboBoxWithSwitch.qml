import QtQuick 2.9
import QtQuick.Controls 2.4
import QtQuick.Layouts 1.3

Row {
    spacing: 10
    anchors {
        left: parent.left
        right: parent.right
        margins: 10
    }

    ComboBox {
        width: 200
        anchors.verticalCenter: parent.verticalCenter

        model: ["Вариант 1", "Вариант 2", "Вариант 3"]

        background: Rectangle {
            color: "#f0f0f0"
            border.color: "black"
            radius: 5
        }

        contentItem: Text {
            text: parent.currentText
            color: "blue"
            font.bold: true
            font.pixelSize: 16
            verticalAlignment: Text.AlignVCenter
            padding: 5
        }

        indicator: Item {
            width: 20
            height: 20
            Rectangle {
                anchors.centerIn: parent

                width: 10
                height: 2
                color: parent.activeFocus ? "lightgreen" : "lightgray"
            }
        }

    }

    Item {
        width: 50
        height: 50

        SwitchButton {
            anchors.centerIn: parent
        }
    }
}
