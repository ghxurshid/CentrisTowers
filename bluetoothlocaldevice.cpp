#include <QDebug>
#include <QFile>
#include <QDataStream>
#include "bluetoothlocaldevice.h"

#ifdef Q_OS_ANDROID
#include <QtAndroidExtras>
#endif

BluetoothLocalDevice::BluetoothLocalDevice(QObject *parent) : QObject(parent)
{
    m_socket = new QBluetoothSocket(QBluetoothServiceInfo::RfcommProtocol);

    QObject::connect(m_socket, &QBluetoothSocket::connected, this, &BluetoothLocalDevice::onDeviceConnected);
    QObject::connect(m_socket, &QBluetoothSocket::disconnected, this, &BluetoothLocalDevice::onDeviceDisconnected);
    QObject::connect(m_socket, &QBluetoothSocket::stateChanged, this, &BluetoothLocalDevice::onStateChanged);
    QObject::connect(m_socket, QOverload<QBluetoothSocket::SocketError>::of(&QBluetoothSocket::error), this, &BluetoothLocalDevice::onErrorOccured);
}

BluetoothLocalDevice::~BluetoothLocalDevice()
{
    if (m_socket->isOpen()) m_socket->close();
    delete m_socket;
    m_socket = nullptr;
}

QString BluetoothLocalDevice::name()
{
    auto name = m_selectedDevice.name();
    return name.isEmpty() ? "..." : name;
}

int BluetoothLocalDevice::status()
{
    int state = 2;

    switch (m_socket->state())
    {
        case QBluetoothSocket::UnconnectedState:
        case QBluetoothSocket::BoundState: state = 2; break;

        case QBluetoothSocket::ServiceLookupState:
        case QBluetoothSocket::ConnectingState: state = 1; break;

        case QBluetoothSocket::ConnectedState:
        case QBluetoothSocket::ListeningState:
        case QBluetoothSocket::ClosingState: state = 0; break;
    }

    return state;
}

void BluetoothLocalDevice::buttonClick()
{
    if (m_socket->isOpen())
        disconnectFromSelectedDevice();
    else connectToSelectedDevice();
}

void BluetoothLocalDevice::onErrorOccured(QBluetoothSocket::SocketError error)
{
    Q_UNUSED(error);   
    emit errorOccured(m_socket->errorString());
}

void BluetoothLocalDevice::sendData(bool allPressed, bool randPressed, bool homeOn, int homeValue)
{
    if (m_socket->isOpen() && m_socket->isWritable())
    {
        QString formatedString = QString("**%1,%2,%3,%4##")
                                        .arg(allPressed ? "1" : "0")
                                        .arg(randPressed ? "1" : "0")
                                        .arg(homeOn ? "1" : "0")
                                        .arg(homeValue > 0 ? homeValue : 0);

        formatedString.push_back('\n');
        auto packet = formatedString.toUtf8();
        m_socket->write(packet.constData(), packet.size());
    }
}

void BluetoothLocalDevice::onSelected(const QBluetoothDeviceInfo deviceInfo)
{
    disconnectFromSelectedDevice();
    m_selectedDevice = deviceInfo;
    connectToSelectedDevice();

    emit nameChanged();
}

void BluetoothLocalDevice::onDeviceConnected()
{
    emit statusChanged();
}

void BluetoothLocalDevice::onDeviceDisconnected()
{
    emit statusChanged();
}

void BluetoothLocalDevice::onStateChanged(QBluetoothSocket::SocketState state)
{
    Q_UNUSED(state)
    emit statusChanged();
}

void BluetoothLocalDevice::connectToSelectedDevice()
{
    if (m_selectedDevice.isValid())
    {
        m_socket->connectToService(m_selectedDevice.address(), QBluetoothUuid::SerialPort);
    }
}

void BluetoothLocalDevice::disconnectFromSelectedDevice()
{
    if (m_socket->isOpen()) m_socket->close();
}
