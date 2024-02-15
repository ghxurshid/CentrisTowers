QT += quick bluetooth
CONFIG += c++11

# The following define makes your compiler emit warnings if you use
# any Qt feature that has been marked deprecated (the exact warnings
# depend on your compiler). Refer to the documentation for the
# deprecated API to know how to port your code away from it.
DEFINES += QT_DEPRECATED_WARNINGS

# You can also make your code fail to compile if it uses deprecated APIs.
# In order to do so, uncomment the following line.
# You can also select to disable deprecated APIs only up to a certain version of Qt.
#DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0x060000    # disables all the APIs deprecated before Qt 6.0.0

SOURCES += \
        main.cpp \
    bluetoothdevicelistmodel.cpp \
    bluetoothlocaldevice.cpp

RESOURCES += qml.qrc \
    img.qrc

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

# Additional import path used to resolve QML modules just for Qt Quick Designer
QML_DESIGNER_IMPORT_PATH =

# Default rules for deployment.
qnx: target.path = /tmp/$${TARGET}/bin
else: unix:!android: target.path = /opt/$${TARGET}/bin
!isEmpty(target.path): INSTALLS += target

android {
    QT += androidextras
    QMAKE_LINK += -nostdlib++ 
    ANDROID_PACKAGE_SOURCE_DIR = $$PWD/resources
}

DISTFILES += \
    BluetoothDeviceStatus.qml \
    CommandButton.qml \
    SwitchButton.qml \
    main.qml \
    BluetoohDevicesList.qml \
    SelectBox.qml \
    Model.qml \
    resources/assets/images/B-10.jpg \
    resources/assets/images/B-11.jpg \
    resources/assets/images/B-12.jpg \
    resources/assets/images/B-13.jpg \
    resources/assets/images/B-14.jpg \
    resources/assets/images/B-15.jpg \
    resources/assets/images/B-16.jpg \
    resources/assets/images/B-17.jpg \
    resources/assets/images/B-18.jpg \
    resources/assets/images/B-19.jpg \
    resources/assets/images/B-2.jpg \
    resources/assets/images/B-3.jpg \
    resources/assets/images/B-4.jpg \
    resources/assets/images/B-5.jpg \
    resources/assets/images/B-6.jpg \
    resources/assets/images/B-7.jpg \
    resources/assets/images/B-8.jpg \
    resources/assets/images/B-9.jpg \
    resources/assets/images/C-10.jpg \
    resources/assets/images/C-11.jpg \
    resources/assets/images/C-12.jpg \
    resources/assets/images/C-13.jpg \
    resources/assets/images/C-14.jpg \
    resources/assets/images/C-15.jpg \
    resources/assets/images/C-16.jpg \
    resources/assets/images/C-17.jpg \
    resources/assets/images/C-2.jpg \
    resources/assets/images/C-3.jpg \
    resources/assets/images/C-4.jpg \
    resources/assets/images/C-5.jpg \
    resources/assets/images/C-6.jpg \
    resources/assets/images/C-7.jpg \
    resources/assets/images/C-8.jpg \
    resources/assets/images/C-9.jpg \
    resources/assets/images/D-E-10-87.jpg \
    resources/assets/images/D-E-10-88.jpg \
    resources/assets/images/D-E-10-89.jpg \
    resources/assets/images/D-E-10-90.jpg \
    resources/assets/images/D-E-10-91.jpg \
    resources/assets/images/D-E-10-92.jpg \
    resources/assets/images/D-E-10-93.jpg \
    resources/assets/images/D-E-10-94.jpg \
    resources/assets/images/D-E-10-95.jpg \
    resources/assets/images/D-E-10-96.jpg \
    resources/assets/images/D-E-10.jpg \
    resources/assets/images/D-E-11-100.jpg \
    resources/assets/images/D-E-11-101.jpg \
    resources/assets/images/D-E-11-102.jpg \
    resources/assets/images/D-E-11-103.jpg \
    resources/assets/images/D-E-11-104.jpg \
    resources/assets/images/D-E-11-105.jpg \
    resources/assets/images/D-E-11-106.jpg \
    resources/assets/images/D-E-11-97.jpg \
    resources/assets/images/D-E-11-98.jpg \
    resources/assets/images/D-E-11-99.jpg \
    resources/assets/images/D-E-11.jpg \
    resources/assets/images/D-E-3-17.jpg \
    resources/assets/images/D-E-3-18.jpg \
    resources/assets/images/D-E-3-19.jpg \
    resources/assets/images/D-E-3-20.jpg \
    resources/assets/images/D-E-3-21.jpg \
    resources/assets/images/D-E-3-22.jpg \
    resources/assets/images/D-E-3-23.jpg \
    resources/assets/images/D-E-3-24.jpg \
    resources/assets/images/D-E-3-25.jpg \
    resources/assets/images/D-E-3-26.jpg \
    resources/assets/images/D-E-3-27.jpg \
    resources/assets/images/D-E-3.jpg \
    resources/assets/images/D-E-4-28.jpg \
    resources/assets/images/D-E-4-29.jpg \
    resources/assets/images/D-E-4-30.jpg \
    resources/assets/images/D-E-4-31.jpg \
    resources/assets/images/D-E-4-32.jpg \
    resources/assets/images/D-E-4-33.jpg \
    resources/assets/images/D-E-4-34.jpg \
    resources/assets/images/D-E-4-35.jpg \
    resources/assets/images/D-E-4-36.jpg \
    resources/assets/images/D-E-4-37.jpg \
    resources/assets/images/D-E-4-38.jpg \
    resources/assets/images/D-E-4.jpg \
    resources/assets/images/D-E-5-39.jpg \
    resources/assets/images/D-E-5-40.jpg \
    resources/assets/images/D-E-5-41.jpg \
    resources/assets/images/D-E-5-42.jpg \
    resources/assets/images/D-E-5-43.jpg \
    resources/assets/images/D-E-5-44.jpg \
    resources/assets/images/D-E-5-45.jpg \
    resources/assets/images/D-E-5-46.jpg \
    resources/assets/images/D-E-5-47.jpg \
    resources/assets/images/D-E-5-48.jpg \
    resources/assets/images/D-E-5-49.jpg \
    resources/assets/images/D-E-5.jpg \
    resources/assets/images/D-E-6-50.jpg \
    resources/assets/images/D-E-6-51.jpg \
    resources/assets/images/D-E-6-52.jpg \
    resources/assets/images/D-E-6-53.jpg \
    resources/assets/images/D-E-6-54.jpg \
    resources/assets/images/D-E-6-55.jpg \
    resources/assets/images/D-E-6-56.jpg \
    resources/assets/images/D-E-6.jpg \
    resources/assets/images/D-E-7-57.jpg \
    resources/assets/images/D-E-7-58.jpg \
    resources/assets/images/D-E-7-59.jpg \
    resources/assets/images/D-E-7-60.jpg \
    resources/assets/images/D-E-7-61.jpg \
    resources/assets/images/D-E-7-62.jpg \
    resources/assets/images/D-E-7-63.jpg \
    resources/assets/images/D-E-7-64.jpg \
    resources/assets/images/D-E-7-65.jpg \
    resources/assets/images/D-E-7-66.jpg \
    resources/assets/images/D-E-7.jpg \
    resources/assets/images/D-E-8-67.jpg \
    resources/assets/images/D-E-8-68.jpg \
    resources/assets/images/D-E-8-69.jpg \
    resources/assets/images/D-E-8-70.jpg \
    resources/assets/images/D-E-8-71.jpg \
    resources/assets/images/D-E-8-72.jpg \
    resources/assets/images/D-E-8-73.jpg \
    resources/assets/images/D-E-8-74.jpg \
    resources/assets/images/D-E-8-75.jpg \
    resources/assets/images/D-E-8-76.jpg \
    resources/assets/images/D-E-8.jpg \
    resources/assets/images/D-E-9-77.jpg \
    resources/assets/images/D-E-9-78.jpg \
    resources/assets/images/D-E-9-79.jpg \
    resources/assets/images/D-E-9-80.jpg \
    resources/assets/images/D-E-9-81.jpg \
    resources/assets/images/D-E-9-82.jpg \
    resources/assets/images/D-E-9-83.jpg \
    resources/assets/images/D-E-9-84.jpg \
    resources/assets/images/D-E-9-85.jpg \
    resources/assets/images/D-E-9-86.jpg \
    resources/assets/images/D-E-9.jpg \
    resources/assets/images/F-G-10-66.jpg \
    resources/assets/images/F-G-10-67.jpg \
    resources/assets/images/F-G-10-68.jpg \
    resources/assets/images/F-G-10-69.jpg \
    resources/assets/images/F-G-10-70.jpg \
    resources/assets/images/F-G-10-71.jpg \
    resources/assets/images/F-G-10.jpg \
    resources/assets/images/F-G-11-72.jpg \
    resources/assets/images/F-G-11-73.jpg \
    resources/assets/images/F-G-11-74.jpg \
    resources/assets/images/F-G-11-75.jpg \
    resources/assets/images/F-G-11-76.jpg \
    resources/assets/images/F-G-11-77.jpg \
    resources/assets/images/F-G-11.jpg \
    resources/assets/images/F-G-4-20.jpg \
    resources/assets/images/F-G-4-21.jpg \
    resources/assets/images/F-G-4-22.jpg \
    resources/assets/images/F-G-4-23.jpg \
    resources/assets/images/F-G-4-24.jpg \
    resources/assets/images/F-G-4-25.jpg \
    resources/assets/images/F-G-4-26.jpg \
    resources/assets/images/F-G-4-27.jpg \
    resources/assets/images/F-G-4-28.jpg \
    resources/assets/images/F-G-4-29.jpg \
    resources/assets/images/F-G-4-30.jpg \
    resources/assets/images/F-G-4.jpg \
    resources/assets/images/F-G-5-31.jpg \
    resources/assets/images/F-G-5-32.jpg \
    resources/assets/images/F-G-5-33.jpg \
    resources/assets/images/F-G-5-34.jpg \
    resources/assets/images/F-G-5-35.jpg \
    resources/assets/images/F-G-5-36.jpg \
    resources/assets/images/F-G-5-37.jpg \
    resources/assets/images/F-G-5-38.jpg \
    resources/assets/images/F-G-5-39.jpg \
    resources/assets/images/F-G-5-40.jpg \
    resources/assets/images/F-G-5-41.jpg \
    resources/assets/images/F-G-5.jpg \
    resources/assets/images/F-G-6-42.jpg \
    resources/assets/images/F-G-6-43.jpg \
    resources/assets/images/F-G-6-44.jpg \
    resources/assets/images/F-G-6-45.jpg \
    resources/assets/images/F-G-6-46.jpg \
    resources/assets/images/F-G-6-47.jpg \
    resources/assets/images/F-G-6.jpg \
    resources/assets/images/F-G-7-48.jpg \
    resources/assets/images/F-G-7-49.jpg \
    resources/assets/images/F-G-7-50.jpg \
    resources/assets/images/F-G-7-51.jpg \
    resources/assets/images/F-G-7-52.jpg \
    resources/assets/images/F-G-7-53.jpg \
    resources/assets/images/F-G-7.jpg \
    resources/assets/images/F-G-8-54.jpg \
    resources/assets/images/F-G-8-55.jpg \
    resources/assets/images/F-G-8-56.jpg \
    resources/assets/images/F-G-8-57.jpg \
    resources/assets/images/F-G-8-58.jpg \
    resources/assets/images/F-G-8-59.jpg \
    resources/assets/images/F-G-8.jpg \
    resources/assets/images/F-G-9-60.jpg \
    resources/assets/images/F-G-9-61.jpg \
    resources/assets/images/F-G-9-62.jpg \
    resources/assets/images/F-G-9-63.jpg \
    resources/assets/images/F-G-9-64.jpg \
    resources/assets/images/F-G-9-65.jpg \
    resources/assets/images/F-G-9.jpg \
    resources/assets/images/plan.jpg \
    resources/assets/slayds/IMG_7508.JPG \
    resources/assets/slayds/IMG_7512.JPG \
    resources/assets/slayds/IMG_7519.JPG \
    resources/assets/slayds/IMG_7522.JPG \
    resources/assets/slayds/IMG_7525.JPG \
    resources/assets/slayds/IMG_7529.JPG \
    resources/assets/slayds/IMG_7534.JPG \
    resources/icons/bluetooth_connecting.png \
    resources/icons/bluetooth_disabled.png \
    resources/icons/bluetooth_enabled.png \
    resources/icons/bluetooth_icon.png \
    resources/icons/combobox_icon.png

HEADERS += \
    bluetoothdevicelistmodel.h \
    bluetoothlocaldevice.h
