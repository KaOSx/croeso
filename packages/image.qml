 
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
                    text: "Krita is a professional FREE and open source painting program. It is made by artists that want to see affordable art tools for everyone. Supported fields are illustrations, concept art, matte painting, textures, comics and animations."
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
                    text: qsTr("Add Krita")
                    checked: false
                    hoverEnabled: true
                    
                    onCheckedChanged: {
                        if ( ! checked ) {
                            executer.connectSource("sed -i -e 's|krita||' /tmp/croeso_list.txt");
                        }
                        else {
                            executer.connectSource("echo 'krita' >> /tmp/croeso_list.txt");
                        }
                    }
                }

                Image {
                    id: image
                    x: 8
                    y: 12
                    height: 100
                    fillMode: Image.PreserveAspectFit
                    source: "../images/packages/krita.png"
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
                    text: "GIMP provides the tools needed for high quality image manipulation. It gives artists the power and flexibility to transform images into truly unique creations. It is used for producing icons, graphical design elements, and art."
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
                    text: qsTr("Add Gimp")
                    checked: false
                    hoverEnabled: true
                    
                    onCheckedChanged: {
                        if ( ! checked ) {
                            executer.connectSource("sed -i -e 's|gimp||' /tmp/croeso_list.txt");
                        }
                        else {
                            executer.connectSource("echo 'gimp' >> /tmp/croeso_list.txt");
                        }
                    }
                }
                
                Image {
                    id: image2
                    x: 8
                    y: 12
                    height: 100
                    fillMode: Image.PreserveAspectFit
                    source: "../images/packages/gimp.png"
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
                    text: "digiKam is an advanced open-source digital photo management application. The application provides a comprehensive set of tools for importing, managing, editing, and sharing photos and raw files. digiKam organizes photos, raw files, and videos into albums."
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
                    text: qsTr("Add Digikam")
                    checked: false
                    hoverEnabled: true
                    
                    onCheckedChanged: {
                        if ( ! checked ) {
                            executer.connectSource("sed -i -e 's|digikam||' /tmp/croeso_list.txt");
                        }
                        else {
                            executer.connectSource("echo 'digikam' >> /tmp/croeso_list.txt");
                        }
                    }
                }
                
                Image {
                    id: image3
                    x: 8
                    y: 12
                    height: 100
                    fillMode: Image.PreserveAspectFit
                    source: "../images/packages/digikam.png"
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
                    text: "Nomacs is a free, open source image viewer. It can be used for viewing all common image formats including RAW & psd images, and includes image manipulation methods for adjusting brightness, contrast, saturation, hue, gamma, exposure."
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
                    text: qsTr("Add Nomacs")
                    checked: false
                    hoverEnabled: true
                    
                    onCheckedChanged: {
                        if ( ! checked ) {
                            executer.connectSource("sed -i -e 's|nomacs||' /tmp/croeso_list.txt");
                        }
                        else {
                            executer.connectSource("echo 'nomacs' >> /tmp/croeso_list.txt");
                        }
                    }
                }
                
                Image {
                    id: image4
                    x: 8
                    y: 12
                    height: 100
                    fillMode: Image.PreserveAspectFit
                    source: "../images/packages/nomacs.png"
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
