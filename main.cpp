#include <QGuiApplication>
#include <QQmlApplicationEngine>

#include "bluetoothlocaldevice.h"
#include "bluetoothdevicelistmodel.h"

int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

    QGuiApplication app(argc, argv);

    qmlRegisterType<BluetoothLocalDevice>("BluetoothLocalDeviceModule", 1, 0, "BluetoothLocalDevice");
    qmlRegisterType<BluetoothDeviceListModel>("BluetoothDeviceListModelModule", 1, 0, "BluetoothDeviceListModel");

    QQmlApplicationEngine engine;
    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));
    if (engine.rootObjects().isEmpty())
        return -1;

    return app.exec();
}
