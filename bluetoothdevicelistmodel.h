#ifndef BLUETOOTHDEVICELISTMODEL_H
#define BLUETOOTHDEVICELISTMODEL_H
#include <QAbstractListModel>
#include <QtBluetooth/QBluetoothDeviceDiscoveryAgent>
#include <QtBluetooth/QBluetoothLocalDevice>
#include <QtBluetooth/QBluetoothDeviceInfo>
#include <QVector>
#include <QTimer>

class BluetoothDeviceListModel : public QAbstractListModel
{
    Q_OBJECT
public:
    explicit BluetoothDeviceListModel(QObject *parent = nullptr);

    enum MyRoles {
        Name = Qt::UserRole + 1,
        Address = Qt::UserRole + 2,
        Rssi = Qt::UserRole + 3,
        IsValid = Qt::UserRole + 4
    };

    // Методы, необходимые для реализации абстрактной модели данных
    int rowCount(const QModelIndex &parent = QModelIndex()) const override;
    QVariant data(const QModelIndex &index, int role) const override;

    Q_INVOKABLE void select(int index);

signals:
    void selected(const QBluetoothDeviceInfo deviceInfo);

public slots:
    void onCancelled();
    void onDeviceDiscovered(const QBluetoothDeviceInfo &deviceInfo);
    void onDeviceUpdated(const QBluetoothDeviceInfo &deviceInfo, QBluetoothDeviceInfo::Fields updatedFields);
    void onError(QBluetoothDeviceDiscoveryAgent::Error error);
    void onFinished();

protected:
    QHash<int, QByteArray> roleNames() const override;

private:
    QVector<QBluetoothDeviceInfo> m_devices;
    QBluetoothDeviceDiscoveryAgent m_agent;
};

#endif // BLUETOOTHDEVICELISTMODEL_H
