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
                width: 393
                height: 104
                anchors.centerIn: parent
                text: "Firefox is the trusted Web browser of choice for half a billion people around the world. At Mozilla, we design Firefox for how you use the Web. We make Firefox completely customizable so you can be in control of creating your best Web experience. Firefox has a streamlined and extremely intuitive design to let you focus on any content app or website. <b>Click to install.</b>"
                font.pointSize: 10
                anchors.verticalCenterOffset: 0
                anchors.horizontalCenterOffset: 96
                wrapMode: Text.WordWrap
            }

            MouseArea {
                id: mouseArea
                width: 600
                height: 120
                cursorShape: Qt.PointingHandCursor
                onClicked: {
                    executer.connectSource("konsole -e sudo pacman -Syu firefox");
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
            }

            Rectangle {
                id: rectangle
                width: 600
                height: 120
                color: "#ffffff"
                radius: 10
                border.width: 1
                Text {
                    width: 393
                    height: 104
                    anchors.centerIn: parent
                    text: "Chrome has everything you need to make the most of the web, like quick answers in your address bar, one-click translation, and personalized articles for you on your phone. <b>Click to install.</b>"
                    font.pointSize: 10
                    anchors.verticalCenterOffset: 0
                    anchors.horizontalCenterOffset: 96
                    wrapMode: Text.WordWrap
                }

                MouseArea {
                    id: mouseArea1
                    width: 600
                    height: 120
                    cursorShape: Qt.PointingHandCursor
                    onClicked: {
                        executer.connectSource("konsole -e sudo pacman -Syu google-chrome");
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
                border.width: 1
                Text {
                    width: 371
                    height: 104
                    anchors.centerIn: parent
                    text: "You deserve a better browser Free VPN, ad blocker and Flow - Just a few of the must-have features built into Opera for faster, smoother and distraction-free browsing. <b>Click to install.</b>"
                    font.pointSize: 10
                    anchors.verticalCenterOffset: 0
                    anchors.horizontalCenterOffset: 96
                    wrapMode: Text.WordWrap
                }

                MouseArea {
                    id: mouseArea2
                    width: 600
                    height: 120
                    cursorShape: Qt.PointingHandCursor
                    onClicked: {
                        executer.connectSource("konsole -e sudo pacman -Syu opera");
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
                border.width: 1
                Text {
                    width: 371
                    height: 104
                    anchors.centerIn: parent
                    text: "Otter Browser aims to recreate the best aspects of the classic Opera (12.x) UI using Qt5. We are focused on providing the powerful features power users want while keeping the browser fast and lightweight. We also learned from history and decided to release the browser under the GNU GPL v3. <b>Click to install.</b>"
                    font.pointSize: 10
                    anchors.verticalCenterOffset: 0
                    anchors.horizontalCenterOffset: 96
                    wrapMode: Text.WordWrap
                }

                MouseArea {
                    id: mouseArea3
                    width: 600
                    height: 120
                    cursorShape: Qt.PointingHandCursor
                    onClicked: {
                        executer.connectSource("konsole -e sudo pacman -Syu otter-browser");
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
