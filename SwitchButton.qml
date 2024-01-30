import QtQuick 2.9
import QtQuick.Controls 2.4
import QtQuick.Layouts 1.3

Switch {
    id: switchButton
    anchors.fill: parent
    anchors.leftMargin: parent.width * 0.80
    indicator: Rectangle {
        id: switchIndicator
        color: "#333333"
        height: 14
        width: 14
        radius: 7
        anchors.verticalCenter: parent.verticalCenter
        x: 9 + switchButton.visualPosition * (backgroud.width - 20)

        Behavior on x {
            NumberAnimation { duration: 150; easing.type: Easing.OutCubic }
        }
    }

    background: Rectangle {
        id: backgroud
        width: 40
        height: 20
        radius: 10
        color: "#62C2FF"
        anchors {
            centerIn: parent
            verticalCenter: parent.verticalCenter            
        }
    }

    onCheckedChanged:{

    }
}



