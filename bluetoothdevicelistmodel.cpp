#include <QDebug>
#include <QSysInfo>
#include <QTimer>
#include "bluetoothdevicelistmodel.h"

BluetoothDeviceListModel::BluetoothDeviceListModel(QObject *parent)
    : QAbstractListModel(parent) {

    QObject::connect(&m_agent, &QBluetoothDeviceDiscoveryAgent::canceled, this, &BluetoothDeviceListModel::onCancelled);
    QObject::connect(&m_agent, &QBluetoothDeviceDiscoveryAgent::deviceDiscovered, this, &BluetoothDeviceListModel::onDeviceDiscovered);
    QObject::connect(&m_agent, &QBluetoothDeviceDiscoveryAgent::deviceUpdated, this, &BluetoothDeviceListModel::onDeviceUpdated);
    QObject::connect(&m_agent, &QBluetoothDeviceDiscoveryAgent::finished, this, &BluetoothDeviceListModel::onFinished);

    if (QSysInfo::productType() == "windows")
    {
        m_devices.append(QBluetoothDeviceInfo(QBluetoothAddress("00:11:22:33:44:55"), QString("Device 123456789456789123456"), 5));
        m_devices.append(QBluetoothDeviceInfo(QBluetoothAddress("55:44:33:22:11:00"), QString("Device 265986522548754123145"), 10));
//        m_devices.append(QBluetoothDeviceInfo(QBluetoothAddress("11:22:33:44:55:66"), QString("Device 987654321987654321987"), 15));
//        m_devices.append(QBluetoothDeviceInfo(QBluetoothAddress("22:33:44:55:66:77"), QString("Device 741852963741852963741"), 20));
//        m_devices.append(QBluetoothDeviceInfo(QBluetoothAddress("33:44:55:66:77:88"), QString("Device 369258147369258147369"), 25));
//        m_devices.append(QBluetoothDeviceInfo(QBluetoothAddress("44:55:66:77:88:99"), QString("Device 159263748159263748159"), 30));
//        m_devices.append(QBluetoothDeviceInfo(QBluetoothAddress("55:66:77:88:99:00"), QString("Device 852147963852147963852"), 35));
//        m_devices.append(QBluetoothDeviceInfo(QBluetoothAddress("66:77:88:99:00:11"), QString("Device 963852741963852741963"), 40));
//        m_devices.append(QBluetoothDeviceInfo(QBluetoothAddress("77:88:99:00:11:22"), QString("Device 123456789123456789123"), 45));
//        m_devices.append(QBluetoothDeviceInfo(QBluetoothAddress("88:99:00:11:22:33"), QString("Device 456789123456789123456"), 50));
//        m_devices.append(QBluetoothDeviceInfo(QBluetoothAddress("99:00:11:22:33:44"), QString("Device 789123456789123456789"), 55));
//        m_devices.append(QBluetoothDeviceInfo(QBluetoothAddress("AA:BB:CC:DD:EE:FF"), QString("Device 147258369147258369147"), 60));
//        m_devices.append(QBluetoothDeviceInfo(QBluetoothAddress("BB:CC:DD:EE:FF:AA"), QString("Device 258369147258369147258"), 65));
//        m_devices.append(QBluetoothDeviceInfo(QBluetoothAddress("CC:DD:EE:FF:AA:BB"), QString("Device 369147258369147258369"), 70));
//        m_devices.append(QBluetoothDeviceInfo(QBluetoothAddress("DD:EE:FF:AA:BB:CC"), QString("Device 123456789123456789123"), 75));
    }

    startDiscovery();
}

int BluetoothDeviceListModel::rowCount(const QModelIndex &parent) const
{
    Q_UNUSED(parent);
    return m_devices.count();
}

QVariant BluetoothDeviceListModel::data(const QModelIndex &index, int role) const
{
    if (!index.isValid())
        return QVariant();

    if (index.row() < 0 || index.row() >= m_devices.count())
        return QVariant();

    auto device = m_devices[index.row()];

    if (role == Name)
        return device.name();

    if (role == Address)
        return device.address().toString();

    if (role == Rssi)
        return device.rssi();

    if (role == IsValid)
        return device.isValid();

    return QVariant();
}

void BluetoothDeviceListModel::select(int index)
{
    if (index < 0 || index >= m_devices.count()) return;
    auto device = m_devices[index];
    emit selected(device);
}

void BluetoothDeviceListModel::onYAtEndArrived()
{
    if (!isDiscoveryActive()) startDiscovery();
}

bool BluetoothDeviceListModel::isDiscoveryActive()
{
    return m_agent.isActive();
}

void BluetoothDeviceListModel::onCancelled()
{
    qDebug() << "onCancelled: Discovery devices cancelled by user!";
}

void BluetoothDeviceListModel::onDeviceDiscovered(const QBluetoothDeviceInfo &deviceInfo)
{
    Q_UNUSED(deviceInfo)
    auto discoveredDevices = m_agent.discoveredDevices();

    qDebug() << "onDeviceDiscovered: " << (deviceInfo.name().isEmpty() ? deviceInfo.address().toString() : deviceInfo.name());

    beginInsertRows(QModelIndex(), m_devices.count(), m_devices.count());
    m_devices.append(deviceInfo);
    endInsertRows();
}

void BluetoothDeviceListModel::onDeviceUpdated(const QBluetoothDeviceInfo &deviceInfo, QBluetoothDeviceInfo::Fields updatedFields)
{
    Q_UNUSED(deviceInfo)
    Q_UNUSED(updatedFields)

    qDebug() << "onDeviceUpdated: " << (deviceInfo.name().isEmpty() ? deviceInfo.address().toString() : deviceInfo.name()) << " | " << updatedFields;

    for (int i = 0; i < m_devices.count(); i ++)
    {
        if (m_devices[i].address().toUInt64() == deviceInfo.address().toUInt64())
        {
            m_devices.replace(i, deviceInfo);
            emit dataChanged(createIndex(i, 0), createIndex(i, 0));
            break;
        }
    }
}

void BluetoothDeviceListModel::onError(QBluetoothDeviceDiscoveryAgent::Error error)
{
    qDebug() << "onError: " << error << " | " << m_agent.errorString();
}

void BluetoothDeviceListModel::onFinished()
{
    auto devices = m_agent.discoveredDevices();
    emit discoveryStatusChanged();

}

QHash<int, QByteArray> BluetoothDeviceListModel::roleNames() const
{
    QHash<int, QByteArray> roles;
    roles[Name] = "name";
    roles[Address] = "address";
    roles[Rssi] = "rssi";
    roles[IsValid] = "isValid";
    return roles;
}

void BluetoothDeviceListModel::startDiscovery()
{
    m_agent.start();
    emit discoveryStatusChanged();
}
