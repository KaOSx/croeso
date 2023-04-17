/***************************************************************************
 *   Copyright (C) 2018 - 2023 Anke Boersma <demm@kaosx.us>       *
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
import org.kde.plasma.core 2.0 as PlasmaCore
import org.kde.plasma.plasma5support 2.0 as P5Support

Page1Form {
    P5Support.DataSource {
        id: executer
        engine: "executable"
        onNewData: {executer.disconnectSource(sourceName);}
    }

    switch1.onCheckedChanged: {
        if ( ! switch1.checked ) {
            executer.connectSource("rm ~/.config/autostart/croeso.desktop");
        }
        else {
            executer.connectSource("cp /usr/share/applications/croeso.desktop ~/.config/autostart/croeso.desktop");
        }
    }
    
    button1.onClicked: {
        executer.connectSource("kcmshell6 style");
    }
    button2.onClicked: {
        executer.connectSource("kcmshell6 kcm_desktoptheme");
    }
    button3.onClicked: {
        executer.connectSource("kcmshell6 kwindecoration");
    }
    button4.onClicked: {
        executer.connectSource("kcmshell6 mouse");
    }
    button5.onClicked: {
        executer.connectSource("kcmshell6 icons");
    }
    button6.onClicked: {
        executer.connectSource("kcmshell6 kcm_kwin_virtualdesktops");
    }
    button7.onClicked: {
        executer.connectSource("kcmshell6 kscreen");
    }
    button8.onClicked: {
        executer.connectSource("kcmshell6 colors");
    }
    button9.onClicked: {
        executer.connectSource("kcmshell6 fonts");
    }
}
