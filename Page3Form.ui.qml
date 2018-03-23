/***************************************************************************
 *   Copyright (C) 2018 Anke Boersma <demm@kaosx.us>       *
 *                                                                         *
 *   This program is free software; you can redistribute it and/or modify  *
 *   it under the terms of the GNU General Public License as published by  *
 *   the Free Software Foundation; either version 2 of the License, or     *
 *   (at your option) any later version.                                   *
 *                                                                         *
 *   This program is distributed in the hope that it will be useful,       *
 *   but WITHOUT ANY WARRANTY; without even the implied warranty of        *
 *   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the         *
 *   GNU General Public License for more details.                          *
 *                                                                         *
 *   You should have received a copy of the GNU General Public License     *
 *   along with this program; if not, write to the                         *
 *   Free Software Foundation, Inc.,                                       *
 *   51 Franklin Street, Fifth Floor, Boston, MA 02110-1301, USA.          *
 ***************************************************************************/
import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.3
import QtQuick.Controls.Material 2.1

Item {
    id: item1
    property alias button1: button1
    property alias button2: button2
    property alias button3: button3
    property alias button4: button4
    property alias button5: button5
    property alias button6: button6
    property alias button7: button7
    property alias button8: button8
    property alias button9: button9
    width: 900
    height: 600

    RowLayout {
        width: 800
        anchors.horizontalCenterOffset: 0
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.topMargin: 387
        anchors.top: parent.top

        Button {
            id: button1
            width: 150
            text: qsTr("Firewall")
            hoverEnabled: true
            enabled: true
            Layout.fillWidth: true
            rightPadding: 28
            leftPadding: 28
            checkable: false
            highlighted: false
            Material.elevation: 1

            Image {
                id: image1
                y: 13
                width: 22
                height: 22
                sourceSize.height: 22
                sourceSize.width: 22
                fillMode: Image.PreserveAspectFit
                anchors.verticalCenter: parent.verticalCenter
                anchors.left: parent.left
                anchors.leftMargin: 15
                source: "images/hotspot.svg"
            }
        }

        Button {
            id: button2
            width: 150
            text: qsTr("Energy Savings")
            hoverEnabled: true
            enabled: true
            checkable: false
            opacity: 1
            Layout.fillWidth: true
            rightPadding: 35
            leftPadding: 35
            highlighted: false
            Material.elevation: 1

            Image {
                id: image2
                y: -49
                width: 22
                height: 22
                fillMode: Image.PreserveAspectFit
                anchors.verticalCenter: parent.verticalCenter
                anchors.left: parent.left
                anchors.leftMargin: 15
                source: "images/contrast.svg"
            }
        }

        Button {
            id: button3
            width: 150
            text: qsTr("Systemd Daemon")
            hoverEnabled: true
            opacity: 1
            Layout.fillWidth: true
            rightPadding: 35
            leftPadding: 35
            highlighted: false
            Material.elevation: 1

            Image {
                id: image3
                y: 6
                width: 22
                height: 22
                sourceSize.height: 22
                sourceSize.width: 22
                fillMode: Image.PreserveAspectFit
                anchors.verticalCenter: parent.verticalCenter
                anchors.left: parent.left
                anchors.leftMargin: 15
                source: "images/fontawesome/usb.svg"
            }
        }
    }

    Image {
        id: image
        x: 270
        y: 25
        width: 100
        height: 100
        anchors.horizontalCenter: rowLayout.horizontalCenter
        source: "images/advanced.svg"
    }

    RowLayout {
        id: rowLayout
        x: 101
        y: 441
        width: 800
        height: 48
        anchors.horizontalCenterOffset: 0
        anchors.horizontalCenter: parent.horizontalCenter

        Button {
            id: button4
            width: 150
            text: qsTr("Add Users")
            hoverEnabled: true
            opacity: 1
            rightPadding: 28
            leftPadding: 28
            Layout.fillWidth: true
            checkable: false
            highlighted: false
            Material.elevation: 1

            Image {
                id: image4
                y: 10
                width: 22
                height: 22
                anchors.verticalCenter: parent.verticalCenter
                anchors.left: parent.left
                anchors.leftMargin: 15
                fillMode: Image.PreserveAspectFit
                source: "images/folder-publicshare.svg"
            }
        }

        Button {
            id: button5
            width: 150
            text: qsTr("Network Management")
            hoverEnabled: true
            opacity: 1
            rightPadding: 28
            leftPadding: 28
            Layout.fillWidth: true
            highlighted: false
            Material.elevation: 1

            Image {
                id: image5
                y: 10
                width: 22
                height: 22
                anchors.verticalCenter: parent.verticalCenter
                anchors.left: parent.left
                anchors.leftMargin: 15
                fillMode: Image.PreserveAspectFit
                source: "images/network-connect.svg"
            }
        }

        Button {
            id: button6
            width: 150
            text: qsTr("KDE Wallet")
            hoverEnabled: true
            opacity: 1
            rightPadding: 28
            leftPadding: 28
            highlighted: false
            Layout.fillWidth: true
            Material.elevation: 1

            Image {
                id: image6
                y: 10
                width: 22
                height: 22
                fillMode: Image.PreserveAspectFit
                sourceSize.width: 22
                sourceSize.height: 21
                anchors.verticalCenter: parent.verticalCenter
                anchors.left: parent.left
                anchors.leftMargin: 15
                source: "images/document-decrypt.svg"
            }
        }
    }

    RowLayout {
        x: -9
        y: 3
        width: 800
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.topMargin: 495
        anchors.top: parent.top
        Button {
            id: button7
            width: 150
            text: qsTr("Configure Search")
            hoverEnabled: true
            leftPadding: 28
            checkable: false
            Layout.fillWidth: true
            Material.elevation: 1
            Image {
                id: image7
                y: 13
                width: 22
                height: 22
                anchors.left: parent.left
                source: "images/search.svg"
                fillMode: Image.PreserveAspectFit
                anchors.leftMargin: 15
                anchors.verticalCenter: parent.verticalCenter
            }
            rightPadding: 28
            highlighted: false
            enabled: true
        }

        Button {
            id: button8
            width: 150
            text: qsTr("Pacman Cache")
            hoverEnabled: true
            leftPadding: 35
            opacity: 1
            checkable: false
            Layout.fillWidth: true
            Material.elevation: 1
            Image {
                id: image8
                y: -49
                width: 22
                height: 22
                sourceSize.height: 22
                sourceSize.width: 22
                anchors.left: parent.left
                source: "images/fontawesome/linux.svg"
                fillMode: Image.PreserveAspectFit
                anchors.leftMargin: 15
                anchors.verticalCenter: parent.verticalCenter
            }
            rightPadding: 35
            highlighted: false
            enabled: true
        }

        Button {
            id: button9
            width: 150
            text: qsTr("Font Settings")
            hoverEnabled: true
            checkable: false
            leftPadding: 35
            opacity: 1
            Layout.fillWidth: true
            Material.elevation: 1
            Image {
                id: image9
                y: 6
                width: 22
                height: 22
                sourceSize.height: 22
                sourceSize.width: 22
                anchors.left: parent.left
                source: "images/format-text-symbol.svg"
                fillMode: Image.PreserveAspectFit
                anchors.leftMargin: 15
                anchors.verticalCenter: parent.verticalCenter
            }
            rightPadding: 35
            highlighted: false
        }
        anchors.horizontalCenterOffset: 0
    }
}
