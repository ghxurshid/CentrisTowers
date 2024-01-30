#include "bluetoothmanager.h"

BluetoothManager::BluetoothManager(QObject *parent) : QObject(parent)
{

}

BluetoothDeviceListModel *BluetoothManager::getBtListModel()
{
    return m_deviceList;
}

BluetoothLocalDevice *BluetoothManager::getLocalDeviceModel()
{
    return m_localDevice;
}
