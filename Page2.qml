/***************************************************************************
 *   Copyright (C) 2018 - 2024 Anke Boersma <demm@kaosx.us>       *
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
import QtQuick.Layouts

Page2Form {

    button1.onClicked: {
        Qt.openUrlExternally("https://kaosx.us/docs/");
    }
    button2.onClicked: {
        Qt.openUrlExternally("https://kaosx.us/pacman/");
    }
    button3.onClicked: {
        Qt.openUrlExternally("https://kaosx.us/hardware/nvidia/");
    }
    button4.onClicked: {
        Qt.openUrlExternally("https://kaosx.us/kernels/");
    }
    button5.onClicked: {
         Qt.openUrlExternally("https://kaosx.us/packaging/kcp/");
    }
    button6.onClicked: {
        Qt.openUrlExternally("https://forum.kaosx.us/");
    }
}
