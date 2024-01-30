#ifndef BLUETOOTHLOCALDEVICE_H
#define BLUETOOTHLOCALDEVICE_H

#include <QObject>
#include <QBluetoothSocket>
#include <QBluetoothDeviceInfo>
#include <QBluetoothLocalDevice>
#include <QBluetoothServiceInfo>

class BluetoothLocalDevice : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QString name READ name NOTIFY nameChanged)
    Q_PROPERTY(int status READ status NOTIFY statusChanged)
public:
    explicit BluetoothLocalDevice(QObject *parent = nullptr);
    ~BluetoothLocalDevice();

    QString name();
    int status();

signals:
    void nameChanged();
    void statusChanged();
    void errorOccured(QString message);

public slots:
    void buttonClick();
    void onSelected(const QBluetoothDeviceInfo deviceInfo);

    void onDeviceConnected();
    void onDeviceDisconnected();
    void onStateChanged(QBluetoothSocket::SocketState state);
    void onErrorOccured(QBluetoothSocket::SocketError error);

    void sendData(bool allPressed, bool randPressed, bool homeOn, int homeValue);

protected:
    void connectToSelectedDevice();
    void disconnectFromSelectedDevice();

private:
    int m_status;
    QBluetoothSocket* m_socket;
    QBluetoothDeviceInfo m_selectedDevice;
    QBluetoothLocalDevice m_localDevice;
};

#endif // BLUETOOTHLOCALDEVICE_H
