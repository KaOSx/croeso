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
import QtQuick.Controls.Material 2.1

Item {
    width: 960
    height: 1000

    Flickable {
        id: flick
        anchors.fill: parent
        contentHeight: 2500

        TextArea {
            id: textArea
            x: 28
            y: 14
            width: 700
            height: 2500
            text: qsTr("<h3>About KaOS</h3>
                    <p>The idea behind KaOS is to create a tightly integrated rolling and transparent distribution for the modern desktop, build from scratch with a very specific focus. Focus on <b>one DE (KDE), one toolkit (Qt), one architecture (x86_64)</b> plus a focus on evaluating and selecting the most suitable tools and applications. All work is geared toward packaging, not developing new tools or applications.</p>

                    <p>Moving away from proprietary Operating Systems to open source options (Linux-based, BSD based,Solaris based) is about <b>wanting freedom and choice</b> in almost all cases. But should any such Operating System or Distribution not make some choices of what it believes is the best fit? KaOS sees a lack of focus in that respect. To create the highest quality Distribution possible, there needs to be a focus to make sure the user gets the best possible for whatever choice they made. It simply is not possible to package any and all to work perfect for every Desktop Environment or Toolkit.</p>
                    
                    <p>KaOS has made the choice to use the <b>Linux kernel</b> as a base (though the Illumos kernel is under constant evaluation, and a future switch is a wish). After that choice, the best available package manager, most flexible way of package building, repository maintenance is <b>pacman/makepkg for a rolling distribution</b> like KaOS. As for the Desktop Environment, there will never be a change, whether it is Linux or Illumos based, KDE will be the choice, Qt the Toolkit. With those choices in place, April 2013 package building for this independent distribution was started.</p>

                    <p>KaOS is a build from scratch distribution, <b>every package in every repository is build by and for KaOS</b>. By July 2013 the initial goal of about 1500 packages was reached.</p>

                    <p>When considering the relatively low number of total available packages, please keep one thing in mind. Since there is a focus on one toolkit, one DE, there is <b>no need for excessive splitting of packages</b> to try and make all work for all kinds of different environments. Were in other places, lots of packages are split into 3-4-5, at times 15-20 packages, KaOS simplifies things as much as possible and avoids splitting (examples are xorg apps, around 50 packages are combined in just 3, mesa consists of 2, instead of 15).</p>
                    
                    <p>Making the choice for KDE/QT does not mean KaOS loses sight of the importance of having the <b>best tool available for the job</b>. Most of the time it is believed KDE/Qt provides the superior tool, but there are a few applications were the GTK option is the only available of that kind (Inkscape, Ardour to name two), or in the case of web-browsers for example, the Qt options do not stack up to their GTK counterparts. For those instances, GTK applications are available, though their number will stay limited. This ISO though is a showcase of the power of Qt/KDE so the <b>ISO is GTK free</b>, meaning no Firefox, Chrome or LibreOffice to name a few, since they do depend on GTK</p>
                    
                    <p>The repository layout is simple, and consists of three groups, Core, Main and Apps. A regular complete system update will always give you the latest available, <b>without the need for any re-install</b> of the system. <i>Core</i> has the base packages needed for a system to boot-up, communicate with the BIOS connect most hardware and set basic shell options. Example packages are the kernel, systemd, toolchain for building and basic command-line tools. <i>Main</i> repository consists of all the needed libraries, extra drivers and firmware needed to make the Desktop and Applications function. <i>Apps</i> consists of all packages seen and used by the users, including KDE and any needed tools. <i>Build</i> is were all packages start, whether it is a rebuild, update or new addition, all goes to build, once gone through the proper testing, than they are moved to their respective repository.</p>
                    
                    <p><b>The target users</b> are those who have tried many Operating Systems/Distributions/Desktop Environments and have found they prefer a Distribution that uses all its available resources to work on one DE to make that the best it can be, and know that after their searches, the best for them is KDE. Their used hardware is from about 2005 or later, so there are no issues with running 64 bit software. And the target audience is not afraid to use KDE/Qt versions of their needed applications, likes to see the best available selected for their needs, even if that means learning some new ways of working with a before unused application. There is an understanding selection for similar applications will be limited to 5-6.</p>
                    
                    <p>KDE is a modern Desktop Environment which can make use of most of any graphics or sound card capabilities. This does not mean KDE can’t be made to run on very low-end hardware, but in general there are better options available for such systems (OpenBox for example). The very minimal needed for <b>hard-drive space is 8 Gb, but 25 Gb</b> is recommended as minimal. KaOS will install with 1.5Gb of RAM available, though a much better experience will start with <b>2 Gb of RAM</b>. Since only x86_64 packages are available, a <b>64 bit capable cpu</b> is needed. As with any rolling distribution, updates are frequent and can be large, so a reasonable fast internet connection (dial-up will become very cumbersome) and available monthly data of over 2 Gb are recommended.</p>")
            font.pointSize: 14
            textFormat: Text.RichText
            wrapMode: Text.WordWrap
         }
            ScrollBar.vertical: ScrollBar {
                    width: 5
                    policy: ScrollBar.AlwaysOn
                }
    }

}
