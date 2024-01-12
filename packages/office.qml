 
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
            y: 10
            width: 120
            height: 598
            spacing: 5

            Rectangle {
                width: 600
                height: 110
                radius: 10
                border.width: 0
                Text {
                    width: 393
                    height: 104
                    anchors.centerIn: parent
                    text: "Skrooge allows you to manage your personal finances, powered by KDE. Thanks to its many features, it is one of the most powerful way to enter, follow, and analyze your expenses. It support a large number of file formats, so that you can import existing data."
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
                    text: qsTr("Add Skrooge")
                    checked: false
                    hoverEnabled: true
                    
                    onCheckedChanged: {
                        if ( ! checked ) {
                            executer.connectSource("sed -i -e 's|skrooge||' /tmp/croeso_list.txt");
                        }
                        else {
                            executer.connectSource("echo 'skrooge' >> /tmp/croeso_list.txt");
                        }
                    }
                }

                Image {
                    id: image
                    x: 8
                    y: 12
                    height: 100
                    fillMode: Image.PreserveAspectFit
                    source: "../images/packages/skrooge.png"
                }

            }

            Rectangle {
                id: rectangle
                width: 600
                height: 110
                color: "#ffffff"
                radius: 10
                border.width: 0
                Text {
                    width: 393
                    height: 104
                    anchors.centerIn: parent
                    text: "Sigil is a multi-platform EPUB ebook editor. It features EPUB 2 spec support with a lot of EPUB 3 support, Code View and Preview View, complete control over directly editing EPUB syntax in Code View, spell checking with configurable dictionaries and metadata editor."
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
                    text: qsTr("Add Sigil")
                    checked: false
                    hoverEnabled: true
                    
                    onCheckedChanged: {
                        if ( ! checked ) {
                            executer.connectSource("sed -i -e 's|sigil||' /tmp/croeso_list.txt");
                        }
                        else {
                            executer.connectSource("echo 'sigil' >> /tmp/croeso_list.txt");
                        }
                    }
                }
                
                Image {
                    id: image2
                    x: 8
                    y: 12
                    height: 100
                    fillMode: Image.PreserveAspectFit
                    source: "../images/packages/sigil.jpg"
                }
            }

            Rectangle {
                id: rectangle1
                width: 600
                height: 110
                color: "#ffffff"
                radius: 10
                border.width: 0
                Text {
                    width: 371
                    height: 104
                    anchors.centerIn: parent
                    text: "Scribus is one of the premier Open Source desktop applications. It supports professional publishing features, such as CMYK, spot & ICC color management, versatile PDF creation, has vector drawing tools and rendering of markup languages like LaTeX or Lilypond."
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
                    text: qsTr("Add Scribus")
                    checked: false
                    hoverEnabled: true
                    
                    onCheckedChanged: {
                        if ( ! checked ) {
                            executer.connectSource("sed -i -e 's|scribus||' /tmp/croeso_list.txt");
                        }
                        else {
                            executer.connectSource("echo 'scribus' >> /tmp/croeso_list.txt");
                        }
                    }
                }
                
                Image {
                    id: image3
                    x: 8
                    y: 12
                    height: 100
                    fillMode: Image.PreserveAspectFit
                    source: "../images/packages/scribus.png"
                }
            }
            
            Rectangle {
                id: rectangle2
                width: 600
                height: 110
                color: "#ffffff"
                radius: 10
                border.width: 0
                Text {
                    width: 371
                    height: 104
                    anchors.centerIn: parent
                    text: "FocusWriter is a simple, distraction-free writing environment. It utilizes a hide-away interface that you access by moving your mouse to the edges of the screen, allowing the program to get out of the way so that you can immerse yourself in your work."
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
                    text: qsTr("Add Focuswriter")
                    checked: false
                    hoverEnabled: true
                    
                    onCheckedChanged: {
                        if ( ! checked ) {
                            executer.connectSource("sed -i -e 's|focuswriter||' /tmp/croeso_list.txt");
                        }
                        else {
                            executer.connectSource("echo 'focuswriter' >> /tmp/croeso_list.txt");
                        }
                    }
                }
                
                Image {
                    id: image4
                    x: 8
                    y: 12
                    height: 100
                    fillMode: Image.PreserveAspectFit
                    source: "../images/packages/focuswriter.png"
                }
            }
        /*Rectangle {
                id: rectangle3
                width: 600
                height: 110
                color: "#ffffff"
                radius: 10
                border.width: 0
                Text {
                    width: 371
                    height: 104
                    anchors.centerIn: parent
                    text: "The Calligra Suite offers a comprehensive set of 8 applications which satisfies the office, graphics and management needs, which share some common UI concepts that gives it a modern look better suited for the wide screens of today."
                    font.pointSize: 10
                    anchors.verticalCenterOffset: 0
                    anchors.horizontalCenterOffset: 96
                    wrapMode: Text.WordWrap
                }
                
                Switch {
                    id: element5
                    x: 405
                    y: 73
                    width: 187
                    height: 39
                    text: qsTr("Add Calligra")
                    checked: false
                    hoverEnabled: true
                    
                    onCheckedChanged: {
                        if ( ! checked ) {
                            executer.connectSource("sed -i -e 's|calligra||' /tmp/croeso_list.txt");
                        }
                        else {
                            executer.connectSource("echo 'calligra' >> /tmp/croeso_list.txt");
                        }
                    }
                }
                
                Image {
                    id: image5
                    x: 8
                    y: 12
                    height: 100
                    fillMode: Image.PreserveAspectFit
                    source: "../images/packages/calligra.png"
                }
            }*/
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
