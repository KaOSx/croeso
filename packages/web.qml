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
import org.kde.plasma.core 2.0 as PlasmaCore

Item {
    width: 960
    height: 600
    
    PlasmaCore.DataSource {
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
                    text: "Firefox is the trusted Web browser of choice for half a billion people around the world. At Mozilla, we design Firefox for how you use the Web. We make Firefox completely customizable so you can be in control of creating your best Web experience."
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
                    text: qsTr("Add Firefox")
                    checked: false
                    hoverEnabled: true
                    
                    onCheckedChanged: {
                        if ( ! checked ) {
                            executer.connectSource("sed -i -e 's|firefox||' /tmp/croeso_list.txt");
                            console.log("firefox removed")
                        }
                        else {
                            executer.connectSource("echo 'firefox' >> /tmp/croeso_list.txt");
                            console.log("firefox")
                        }
                    }
                }

                Image {
                    id: image
                    x: 8
                    y: 12
                    height: 100
                    fillMode: Image.PreserveAspectFit
                    source: "../images/packages/firefox.jpg"
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
                    text: "Chrome has everything you need to make the most of the web, like quick answers in your address bar, one-click translation, and personalized articles for you."
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
                    text: qsTr("Add Chrome")
                    checked: false
                    hoverEnabled: true
                    
                    onCheckedChanged: {
                        if ( ! checked ) {
                            executer.connectSource("sed -i -e 's|google-chrome||' /tmp/croeso_list.txt");
                            console.log("chrome removed")
                        }
                        else {
                            executer.connectSource("echo 'google-chrome' >> /tmp/croeso_list.txt");
                            console.log("chrome")
                        }
                    }
                }
                
                Image {
                    id: image2
                    x: 8
                    y: 12
                    height: 100
                    fillMode: Image.PreserveAspectFit
                    source: "../images/packages/chrome.png"
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
                    text: "You deserve a better browser Free VPN, ad blocker and Flow - Just a few of the must-have features built into Opera for faster, smoother and distraction-free browsing."
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
                    text: qsTr("Add Opera")
                    checked: false
                    hoverEnabled: true
                    
                    onCheckedChanged: {
                        if ( ! checked ) {
                            executer.connectSource("sed -i -e 's|opera||' /tmp/croeso_list.txt");
                        }
                        else {
                            executer.connectSource("echo 'opera' >> /tmp/croeso_list.txt");
                        }
                    }
                }
                
                Image {
                    id: image3
                    x: 8
                    y: 12
                    height: 100
                    fillMode: Image.PreserveAspectFit
                    source: "../images/packages/opera.png"
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
                    text: "Otter Browser aims to recreate the best aspects of the classic Opera (12.x) UI using Qt5. We are focused on providing the powerful features power users want while keeping the browser fast and lightweight."
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
                    text: qsTr("Add Otter Browser")
                    checked: false
                    hoverEnabled: true
                    
                    onCheckedChanged: {
                        if ( ! checked ) {
                            executer.connectSource("sed -i -e 's|otter-browser||' /tmp/croeso_list.txt");
                        }
                        else {
                            executer.connectSource("echo 'otter-browser' >> /tmp/croeso_list.txt");
                        }
                    }
                }
                
                Image {
                    id: image4
                    x: 8
                    y: 12
                    height: 100
                    fillMode: Image.PreserveAspectFit
                    source: "../images/packages/otter.jpg"
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
