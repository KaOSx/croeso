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
import QtQuick.Controls.Material 2.1

Item {
    width: 960
    height: 600
        
    Rectangle {
        id: textArea
        x: 28
        y: 14
        anchors.fill: parent
        //color: "white"
        
        Column {
        id: column
        x: 130
        y: 40
        width: 120
        height: 546
        spacing: 3

            Rectangle {
                width: 600
                height: 120
                radius: 10
                border.width: 1
                Text {
                    anchors.centerIn: parent
                    text: "LibreOffice"
                    wrapMode: Text.WrapAtWordBoundaryOrAnywhere
                }

                MouseArea {
                    id: mouseArea
                    width: 600
                    height: 120
                    cursorShape: Qt.PointingHandCursor
                }
            }

            Rectangle {
                id: rectangle
                width: 600
                height: 120
                color: "#ffffff"
                radius: 10
                border.width: 1
                Text {
                    anchors.centerIn: parent
                    text: "Calligra"
                }

                MouseArea {
                    id: mouseArea1
                    width: 600
                    height: 120
                    cursorShape: Qt.PointingHandCursor
                }
            }
        }

        Button {
            id: button
            x: 781
            y: 500
            text: qsTr("Back to group index")
            onClicked: loader.source = ""
            //cursorShape: Qt.PointingHandCursor
        }
    }

}

