/***************************************************************************
 *   Copyright (C) 2018 - 2020 Anke Boersma <demm@kaosx.us>       *
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
import QtQuick.Window 2.0
import QtQuick.Dialogs 1.2
import QtWebView 1.1
import org.kde.plasma.core 2.0 as PlasmaCore

ApplicationWindow {
    visible: true
    minimumWidth: 960
    maximumWidth: 960
    minimumHeight: 640
    maximumHeight: 640
    x: Screen.width / 2 - width / 2
    y: Screen.height / 2 - height / 2
    title: qsTr("Croeso")

    SwipeView {
        id: swipeView
        anchors.fill: parent
        currentIndex: tabBar.currentIndex

        Page1 {
            Label {
                text: qsTr("<div><h2>What is KaOS?</h2>
                            The idea behind KaOS is to create a tightly integrated and transparent<br>
                            distribution for the modern desktop, build from scratch with a very specific focus.<br>
                            Focus on one DE (KDE Plasma), one toolkit (Qt) & one architecture (x86_64).<br>
                            Plus a focus on evaluting and selecting the most suitable tools and applications.<br><br>
                            This page will help you personalize the most commonly used settings in your KaOS workspace quickly.</div>")
                anchors.centerIn: parent
                horizontalAlignment: Text.AlignHCenter
                width: 690
                wrapMode: Text.WordWrap
            }
        }
        
        Page4 {
            //Label {
            //    color: "gray"
            //}
            
            PlasmaCore.DataSource {
                id: executer
                engine: "executable"
                onNewData: {executer.disconnectSource(sourceName);}
            }
            
            Button {
                x: 740
                y: 530
                text: "Install Selected Packages"
                hoverEnabled: true
                onClicked: {
                    executer.connectSource("konsole --hold -e sudo pacman -Syu $(cat /tmp/croeso_list.txt)");
                }
            }
            
        }
        
        Page {
            Loader {
                id: wallpaper
                source: "wallpaper/wall.qml"
            }
        }

        Page2 {
            Label {
                textFormat: Text.RichText
                text: qsTr("<p>To familiarize yourself with KaOS, please read some of these documents.</p>
                            
                            <p>Use the forum for questions, feedback and suggestions.</p>")
                anchors.centerIn: parent
                horizontalAlignment: Text.AlignHCenter
            }
        }
        
        Page3 {
            Label {
                textFormat: Text.RichText
                text: qsTr("<p>This page lists more advanced settings options.  Eventhough more advanced, this does<br>
                            not mean less important.</p>
                            
                            <p>Consider setting these now or revisit at a later time.</p>")
                anchors.centerIn: parent
                horizontalAlignment: Text.AlignHCenter
            }
        }
        
        Page {
            Loader {
                id: about
                source: "notes.qml"
            }
            
        }
        
        Page {
            WebView {
                id: webView
                anchors.fill: parent
                url: "https://kaosx.us/media/notes.html"
                //url: "notes.html"
            }
        }
    }
    
    RowLayout {
        width: 150
        anchors.rightMargin: 20
        anchors.right: parent.right
        anchors.topMargin: 5
        anchors.top: parent.top
    
        Button {
                id: github
                hoverEnabled: true
                onClicked: {  Qt.openUrlExternally("https://github.com/KaOSx"); }
                background: Rectangle {
                    implicitWidth: 22
                    implicitHeight: 22
                    color: "transparent"
                }
                
                ToolTip.delay: 500
                ToolTip.timeout: 5000
                ToolTip.visible: hovered
                ToolTip.text: qsTr("Code & Bug trackers on Github for KaOS")
            
            Image {
                anchors.fill: parent
                sourceSize.width: 22
                sourceSize.height: 22
                fillMode: Image.PreserveAspectFit
                source: "images/fontawesome/github.svg"
            }
        }
                
        Button {
                id: irc
                hoverEnabled: true
                onClicked: {  Qt.openUrlExternally("https://web.libera.chat/#KaOS"); }
                background: Rectangle {
                    implicitWidth: 24
                    implicitHeight: 24
                    color: "transparent"
                }
                
                ToolTip.delay: 500
                ToolTip.timeout: 5000
                ToolTip.visible: hovered
                ToolTip.text: qsTr("Join the KaOS IRC Channel")
            
            Image {
                anchors.fill: parent
                sourceSize.width: 24
                sourceSize.height: 24
                fillMode: Image.PreserveAspectFit
                source: "images/fontawesome/comments.svg"
            }
        }
        
        Button {
                id: gitter
                hoverEnabled: true
                onClicked: {  Qt.openUrlExternally("https://gitter.im/KaOSx/KaOS/"); }
                background: Rectangle {
                    implicitWidth: 22
                    implicitHeight: 22
                    color: "transparent"
                }
                
                ToolTip.delay: 500
                ToolTip.timeout: 5000
                ToolTip.visible: hovered
                ToolTip.text: qsTr("Gitter Chat for KaOS")
            
            Image {
                anchors.fill: parent
                sourceSize.width: 22
                sourceSize.height: 22
                fillMode: Image.PreserveAspectFit
                source: "images/fontawesome/gitter.svg"
            }
        }
        
        Button {
                id: mail
                hoverEnabled: true
                onClicked: {  Qt.openUrlExternally("https://groups.google.com/forum/?fromgroups#!forum/kaos-general"); }
                background: Rectangle {
                    implicitWidth: 22
                    implicitHeight: 22
                    color: "transparent"
                }
                
                ToolTip.delay: 500
                ToolTip.timeout: 5000
                ToolTip.visible: hovered
                ToolTip.text: qsTr("KaOS Mail Group")
            
            Image {
                anchors.fill: parent
                sourceSize.width: 22
                sourceSize.height: 22
                fillMode: Image.PreserveAspectFit
                source: "images/fontawesome/envelope.svg"
            }
        }
    }

    footer: TabBar {
        id: tabBar
        currentIndex: swipeView.currentIndex
        TabButton {
            text: qsTr("Customize")
        }
        TabButton {
            text: qsTr("Packages")
        }
        TabButton {
            text: qsTr("Wallpaper")
        }
        TabButton {
            text: qsTr("Docs")
        }
        TabButton {
            text: qsTr("Advanced")
        }
        TabButton {
            text: qsTr("About")
        }
        TabButton {
            text: qsTr("News")
        }
        TabButton {
            text: qsTr("Quit")
            onClicked: { Qt.quit(); }
        }
    }
}
