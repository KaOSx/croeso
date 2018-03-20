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
                Image {
                    id: image
                    anchors.centerIn: parent
                    anchors.verticalCenterOffset : 100
                    width: 48
                    height: 48
                    source: "images/"
                }
            }
        }
        
        Page {
        WebView {
                    id: webView
                    anchors.fill: parent
                    url: "https://kaosx.us/media/notes.html"
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
            text: qsTr("Release Notes")
        }
    }
}
