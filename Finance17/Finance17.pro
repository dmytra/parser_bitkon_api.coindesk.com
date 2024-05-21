QT += quick
QT += network
QT += core
QT += gui
QT += qml

QT += sql

target.path = /Users/srtsrthwqethqerthsrthwryjwrtsdflly/Downloads/Finance15/bin
INSTALLS += target

# https://doc.qt.io/qt-6.2/android-openssl-support.html
# https://github.com/KDAB/android_openssl
android: include(/Users/<<user>>/Downloads/android_openssl-master/openssl.pri)

CONFIG      += c++11
CONFIG      += mobility
MOBILITY    += sensors


SOURCES += \
            apirest.cpp \
            SqlLiteDatabase.cpp \
            main.cpp \
            mainwindow.cpp
HEADERS += \
            apirest.h \
            SqlLiteDatabase.h \
            mainwindow.h
RESOURCES += qml.qrc

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

# Additional import path used to resolve QML modules just for Qt Quick Designer
QML_DESIGNER_IMPORT_PATH =

#Default rules for deployment.
#qnx: target.path = /tmp/$${TARGET}/bin
#else: unix:!android: target.path = /opt/$${TARGET}/bin
#!isEmpty(target.path): INSTALLS += target

DISTFILES += \
            qml/main.qml \
            qml/ItemWeather.qml \
            qml/Chart.qml
