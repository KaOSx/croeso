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

Page4Form {
    Loader {
        id: loader
    }
        mouseArea.onClicked: {
            loader.source = "packages/web.qml"
        }
        mouseArea1.onClicked: {
            loader.source = "packages/mail.qml"
        }
        mouseArea2.onClicked: {
            loader.source = "packages/video.qml"
        }
        mouseArea3.onClicked: {
            loader.source = "packages/music.qml"
        }
        mouseArea4.onClicked: {
            loader.source = "packages/image.qml"
        }
        mouseArea5.onClicked: {
            loader.source = "packages/office.qml"
        }
}
