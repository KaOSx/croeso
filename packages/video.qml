 
/***************************************************************************
 *   Copyright (C) 2020 - 2023 Anke Boersma <demm@kaosx.us>                *
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
import org.kde.plasma.core 2.0 as PlasmaCore
import org.kde.plasma.plasma5support 2.0 as P5Support

Item {
    width: 960
    height: 600
    
    P5Support.DataSource {
        id: executer
        engine: "executable"
        onNewData: {executer.disconnectSource(sourceName);}
    }

    Rectangle {
        id: textArea
        x: 28
        y: 14
        anchors.fill: parent
        color: "#f2f2f2"
        MouseArea {
            anchors.fill: parent
        }
        
        Column {
            id: column
            x: 130
            y: 40
            width: 120
            height: 546
            spacing: 5

            Rectangle {
                width: 600
                height: 120
                radius: 10
                border.width: 0
                Text {
                    width: 393
                    height: 104
                    anchors.centerIn: parent
                    text: "Kdenlive is an acronym for KDE Non-Linear Video Editor. Through the MLT framework, it integrates plugin effects for video and sound processing or creation. It brings a powerful titling tool, DVD authoring solution, and can be used as a complete studio for video creation."
                    font.pointSize: 10
                    anchors.verticalCenterOffset: 0
                    anchors.horizontalCenterOffset: 96
                    wrapMode: Text.WordWrap
                }
                
                Switch {
                    id: element1
                    x: 405
                    y: 73
                    width: 187
                    height: 39
                    text: qsTr("Add Kdenlive")
                    checked: false
                    hoverEnabled: true
                    
                    onCheckedChanged: {
                        if ( ! checked ) {
                            executer.connectSource("sed -i -e 's|kdenlive6||' /tmp/croeso_list.txt");
                        }
                        else {
                            executer.connectSource("echo 'kdenlive6' >> /tmp/croeso_list.txt");
                        }
                    }
                }

                Image {
                    id: image
                    x: 8
                    y: 12
                    height: 100
                    fillMode: Image.PreserveAspectFit
                    source: "../images/packages/kdenlive.jpg"
                }

            }

            Rectangle {
                id: rectangle
                width: 600
                height: 120
                color: "#ffffff"
                radius: 10
                border.width: 0
                Text {
                    width: 393
                    height: 104
                    anchors.centerIn: parent
                    text: "Openshot is based on the FFmpeg library, OpenShot can read and write most video and image formats. Over 400 transitions are included, which lets you gradually fade from one clip to another. Getting started is as easy as dragging files into OpenShot from your file manager."
                    font.pointSize: 10
                    anchors.verticalCenterOffset: 0
                    anchors.horizontalCenterOffset: 96
                    wrapMode: Text.WordWrap
                }

                Switch {
                    id: element2
                    x: 405
                    y: 73
                    width: 187
                    height: 39
                    text: qsTr("Add Openshot")
                    checked: false
                    hoverEnabled: true
                    
                    onCheckedChanged: {
                        if ( ! checked ) {
                            executer.connectSource("sed -i -e 's|openshot||' /tmp/croeso_list.txt");
                        }
                        else {
                            executer.connectSource("echo 'openshot' >> /tmp/croeso_list.txt");
                        }
                    }
                }
                
                Image {
                    id: image2
                    x: 8
                    y: 12
                    height: 100
                    fillMode: Image.PreserveAspectFit
                    source: "../images/packages/openshot.jpg"
                }
            }

            Rectangle {
                id: rectangle1
                width: 600
                height: 120
                color: "#ffffff"
                radius: 10
                border.width: 0
                Text {
                    width: 371
                    height: 104
                    anchors.centerIn: parent
                    text: "Lightworks has been at the forefront of film editing, having been used on many films including LA Confidential, Pulp Fiction and many more. Lightworks is the only Academy and Emmy award winning editing software that allows you to start on a free plan."
                    font.pointSize: 10
                    anchors.verticalCenterOffset: 0
                    anchors.horizontalCenterOffset: 96
                    wrapMode: Text.WordWrap
                }
                
                Switch {
                    id: element3
                    x: 405
                    y: 73
                    width: 187
                    height: 39
                    text: qsTr("Add Lightworks")
                    checked: false
                    hoverEnabled: true
                    
                    onCheckedChanged: {
                        if ( ! checked ) {
                            executer.connectSource("sed -i -e 's|lightworks||' /tmp/croeso_list.txt");
                        }
                        else {
                            executer.connectSource("echo 'lightworks' >> /tmp/croeso_list.txt");
                        }
                    }
                }
                
                Image {
                    id: image3
                    x: 8
                    y: 12
                    height: 100
                    fillMode: Image.PreserveAspectFit
                    source: "../images/packages/lightworks.png"
                }
            }
            
            Rectangle {
                id: rectangle2
                width: 600
                height: 120
                color: "#ffffff"
                radius: 10
                border.width: 0
                Text {
                    width: 371
                    height: 104
                    anchors.centerIn: parent
                    text: "Avidemux is a free video editor designed for simple cutting, filtering and encoding tasks. It supports many file types, including AVI, DVD compatible MPEG files, MP4 and ASF. Tasks can be automated using projects, job queue and powerful scripting capabilities."
                    font.pointSize: 10
                    anchors.verticalCenterOffset: 0
                    anchors.horizontalCenterOffset: 96
                    wrapMode: Text.WordWrap
                }
                
                Switch {
                    id: element4
                    x: 405
                    y: 73
                    width: 187
                    height: 39
                    text: qsTr("Add Avidemux")
                    checked: false
                    hoverEnabled: true
                    
                    onCheckedChanged: {
                        if ( ! checked ) {
                            executer.connectSource("sed -i -e 's|avidemux||' /tmp/croeso_list.txt");
                        }
                        else {
                            executer.connectSource("echo 'avidemux' >> /tmp/croeso_list.txt");
                        }
                    }
                }
                
                Image {
                    id: image4
                    x: 8
                    y: 12
                    height: 100
                    fillMode: Image.PreserveAspectFit
                    source: "../images/packages/avidemux.jpg"
                }
            }
        }

        ToolButton {
            id: toolButton
            x: 19
            y: 29
            width: 105
            height: 48
            text: qsTr("Back")
            hoverEnabled: true
            onClicked: loader.source = ""

            Image {
                id: image1
                x: 0
                y: 13
                width: 22
                height: 22
                source: "../images/fontawesome/chevron-left-solid.svg"
                fillMode: Image.PreserveAspectFit
            }
        }
    }

}
