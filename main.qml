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
import QtQuick.Window 2.0
import QtQuick.Dialogs 1.2
import QtWebView 1.1
import org.kde.plasma.core 2.0 as PlasmaCore

ApplicationWindow {
    visible: true
    minimumWidth: 900
    maximumWidth: 900
    minimumHeight: 620
    maximumHeight: 620
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
        WebView {
                    id: webView
                    anchors.fill: parent
                    url: "https://kaosx.us/media/notes.html"
                    //url: "notes.html
                }
        }
    }
    
    RowLayout {
        PlasmaCore.DataSource {
            id: executer
            engine: "executable"
            onNewData: {executer.disconnectSource(sourceName);}
        }
        
        width: 150
        anchors.rightMargin: 20
        anchors.right: parent.right
        anchors.topMargin: 5
        anchors.top: parent.top
    
        Image {
                id: github
                sourceSize.width: 22
                sourceSize.height: 22
                source: "images/fontawesome/github.svg"
            
            MouseArea {
                anchors.fill: parent
                cursorShape: Qt.PointingHandCursor;
                onClicked: {  Qt.openUrlExternally("https://github.com/KaOSx"); }
            }
        }
                
        Image {
                id: irc
                sourceSize.width: 22
                sourceSize.height: 22
                fillMode: Image.PreserveAspectFit
                source: "images/fontawesome/comments.svg"
            
            MouseArea {
                anchors.fill: parent
                cursorShape: Qt.PointingHandCursor;
                onClicked: {  Qt.openUrlExternally("https://kiwiirc.com/client/irc.freenode.net/#kaosx"); }
            }
        }
        
        Image {
                id: gplus
                sourceSize.width: 22
                sourceSize.height: 22
                fillMode: Image.PreserveAspectFit
                source: "images/fontawesome/google-plus-g.svg"
            
            MouseArea {
                anchors.fill: parent
                cursorShape: Qt.PointingHandCursor;
                onClicked: {  Qt.openUrlExternally("https://plus.google.com/u/0/communities/116669111554447085724"); }
            }
        }
        
        Image {
                id: gitter
                sourceSize.width: 22
                sourceSize.height: 22
                fillMode: Image.PreserveAspectFit
                source: "images/fontawesome/gitter.svg"
            
            MouseArea {
                anchors.fill: parent
                cursorShape: Qt.PointingHandCursor;
                onClicked: {  Qt.openUrlExternally("https://gitter.im/KaOSx/KaOS/"); }
            }
        }
        
        Image {
                id: mail
                sourceSize.width: 22
                sourceSize.height: 22
                fillMode: Image.PreserveAspectFit
                source: "images/fontawesome/envelope.svg"
            
            MouseArea {
                anchors.fill: parent
                cursorShape: Qt.PointingHandCursor;
                onClicked: {  Qt.openUrlExternally("https://groups.google.com/forum/?fromgroups#!forum/kaos-general"); }
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
            text: qsTr("Documentation")
        }
        TabButton {
            text: qsTr("Advanced Settings")
        }
        TabButton {
            text: qsTr("Release Notes")
        }
    }
}
