 
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
                    text: "KMail is the email component of Kontact, the integrated personal information manager from KDE. Default settings rather compromise on features than security or privacy and separates identities from accounts, giving you a lot of flexibility in multiple organizations."
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
                    text: qsTr("Add Kmail")
                    checked: false
                    hoverEnabled: true
                    
                    onCheckedChanged: {
                        if ( ! checked ) {
                            executer.connectSource("sed -i -e 's|kmail||' /tmp/croeso_list.txt");
                        }
                        else {
                            executer.connectSource("echo 'kmail' >> /tmp/croeso_list.txt");
                        }
                    }
                }

                Image {
                    id: image
                    x: 8
                    y: 12
                    height: 100
                    fillMode: Image.PreserveAspectFit
                    source: "../images/packages/kmail.png"
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
                    text: "Thunderbird makes email better for you, bringing together speed, privacy and the latest technologies.  Multiple features, such as built-in Do Not Track and remote content blocking, work together to ensure your safety and privacy."
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
                    text: qsTr("Add Thunderbird")
                    checked: false
                    hoverEnabled: true
                    
                    onCheckedChanged: {
                        if ( ! checked ) {
                            executer.connectSource("sed -i -e 's|thunderbird||' /tmp/croeso_list.txt");
                        }
                        else {
                            executer.connectSource("echo 'thunderbird' >> /tmp/croeso_list.txt");
                        }
                    }
                }
                
                Image {
                    id: image2
                    x: 8
                    y: 12
                    height: 100
                    fillMode: Image.PreserveAspectFit
                    source: "../images/packages/thunderbird.png"
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
                    text: "Trojitá, a fast Qt IMAP e-mail client. Enables you to access your mail anytime, anywhere. Respects open standards and facilitate modern technologies. We value the vendor-neutrality that IMAP provides and are committed to be as interoperable as possible."
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
                    text: qsTr("Add Trojita")
                    checked: false
                    hoverEnabled: true
                    
                    onCheckedChanged: {
                        if ( ! checked ) {
                            executer.connectSource("sed -i -e 's|trojita||' /tmp/croeso_list.txt");
                        }
                        else {
                            executer.connectSource("echo 'trojita' >> /tmp/croeso_list.txt");
                        }
                    }
                }
                
                Image {
                    id: image3
                    x: 8
                    y: 12
                    height: 100
                    fillMode: Image.PreserveAspectFit
                    source: "../images/packages/trojita.jpg"
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
                    text: "Kube is a modern communication and collaboration client built to just work. It provides online and offline access to all your mail, contacts and calendars. The team works to build a product that is not only visually appealing but also a joy to use."
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
                    text: qsTr("Add Kube")
                    checked: false
                    hoverEnabled: true
                    
                    onCheckedChanged: {
                        if ( ! checked ) {
                            executer.connectSource("sed -i -e 's|kube||' /tmp/croeso_list.txt");
                        }
                        else {
                            executer.connectSource("echo 'kube' >> /tmp/croeso_list.txt");
                        }
                    }
                }
                
                Image {
                    id: image4
                    x: 8
                    y: 12
                    height: 100
                    fillMode: Image.PreserveAspectFit
                    source: "../images/packages/kube.png"
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
