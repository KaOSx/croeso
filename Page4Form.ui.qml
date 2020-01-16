
/***************************************************************************
 *   Copyright (C) 2020 Anke Boersma <demm@kaosx.us>       *
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

Rectangle {
    id: item1
    color: "#f2f2f2"

    width: 900
    height: 600
    property alias mouseArea: mouseArea
    property alias mouseArea1: mouseArea1
    property alias mouseArea2: mouseArea2
    property alias mouseArea3: mouseArea3
    property alias mouseArea4: mouseArea4
    property alias mouseArea5: mouseArea5

    Column {
        id: column
        x: 100
        y: 25
        width: 180
        height: 546
        spacing: 5

        Rectangle {
            width: 180
            height: 180
            border.width: 0
            Text {
                x: 44
                y: 158
                anchors.bottom: parent.bottom
                anchors.rightMargin: 44
                anchors.bottomMargin: 8
                text: "Web-Browsers"
            }

            Image {
                id: image1
                width: 96
                height: 96
                sourceSize.height: 96
                sourceSize.width: 96
                fillMode: Image.PreserveAspectFit
                anchors.centerIn: parent
                source: "images/fontawesome/firefox-brands.svg"
            }

            MouseArea {
                id: mouseArea
                width: 180
                height: 180
                hoverEnabled: true
                //cursorShape: Qt.PointingHandCursor
            }
        }

        Rectangle {
            id: rectangle
            width: 180
            height: 180
            color: "#ffffff"
            border.width: 0
            Text {
                x: 50
                y: 158
                anchors.bottom: parent.bottom
                text: "Email Clients"
                anchors.bottomMargin: 8
            }

            Image {
                id: image2
                width: 96
                height: 96
                sourceSize.height: 96
                sourceSize.width: 96
                fillMode: Image.PreserveAspectFit
                anchors.centerIn: parent
                source: "images/fontawesome/mail-bulk-solid.svg"
            }

            MouseArea {
                id: mouseArea1
                width: 180
                height: 180
                //cursorShape: Qt.PointingHandCursor
            }
        }

        Rectangle {
            id: rectangle1
            width: 180
            height: 180
            color: "#ffffff"
            border.width: 0
            Text {
                x: 48
                y: 158
                anchors.bottom: parent.bottom
                text: "Video Editors"
                anchors.bottomMargin: 8
            }

            Image {
                id: image3
                width: 96
                height: 96
                sourceSize.height: 96
                sourceSize.width: 96
                fillMode: Image.PreserveAspectFit
                anchors.centerIn: parent
                source: "images/fontawesome/film-solid.svg"
            }

            MouseArea {
                id: mouseArea2
                width: 180
                height: 180
                //cursorShape: Qt.PointingHandCursor
            }
        }
    }

    Column {
        id: column1
        x: 387
        y: 25
        width: 180
        height: 546
        spacing: 5

        Rectangle {
            id: rectangle2
            width: 180
            height: 180
            color: "#ffffff"
            border.width: 0
            Text {
                x: 47
                y: 158
                anchors.bottom: parent.bottom
                text: "Music Players"
                anchors.bottomMargin: 8
            }

            Image {
                id: image4
                width: 96
                height: 96
                sourceSize.height: 96
                sourceSize.width: 96
                fillMode: Image.PreserveAspectFit
                anchors.centerIn: parent
                source: "images/fontawesome/volume-up-solid.svg"
            }

            MouseArea {
                id: mouseArea3
                width: 180
                height: 180
                //cursorShape: Qt.PointingHandCursor
            }
        }

        Rectangle {
            id: rectangle3
            width: 180
            height: 180
            color: "#ffffff"
            border.width: 0
            Text {
                x: 25
                y: 158
                anchors.bottom: parent.bottom
                text: "Image Manipulation"
                anchors.bottomMargin: 8
            }

            Image {
                id: image5
                width: 96
                height: 96
                sourceSize.height: 96
                sourceSize.width: 96
                fillMode: Image.PreserveAspectFit
                anchors.centerIn: parent
                source: "images/fontawesome/photo-video-solid.svg"
            }

            MouseArea {
                id: mouseArea4
                width: 180
                height: 180
                //cursorShape: Qt.PointingHandCursor
            }
        }

        Rectangle {
            id: rectangle4
            width: 180
            height: 180
            color: "#ffffff"
            border.width: 0
            Text {
                x: 52
                y: 150
                anchors.bottom: parent.bottom
                text: "Chat Clients"
                anchors.bottomMargin: 8
            }

            Image {
                id: image6
                width: 96
                height: 96
                sourceSize.height: 96
                sourceSize.width: 96
                fillMode: Image.PreserveAspectFit
                anchors.centerIn: parent
                source: "images/fontawesome/comments.svg"
            }

            MouseArea {
                id: mouseArea5
                width: 180
                height: 180
                //cursorShape: Qt.PointingHandCursor
            }
        }
    }

    Text {
        id: element
        x: 609
        y: 215
        width: 238
        height: 218
        text: "<h3>Package Groups</h3>\n
        Please choose one of the groups to see and select the various packages each group contains."
        horizontalAlignment: Text.AlignHCenter
        font.weight: Font.DemiBold
        wrapMode: Text.WordWrap
        font.pixelSize: 15
    }
}
