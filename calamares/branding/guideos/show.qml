/* === This file is part of Calamares - <http://github.com/calamares> ===
 *
 *   Copyright 2015, Teo Mrnjavac <teo@kde.org>
 *   Copyright 2018-2019, Jonathan Carter <jcc@debian.org>
 *
 *   Calamares is free software: you can redistribute it and/or modify
 *   it under the terms of the GNU General Public License as published by
 *   the Free Software Foundation, or (at your option) any later version.
 *
 *   Calamares is distributed in the hope that it will be useful,
 *   but WITHOUT ANY WARRANTY; without even the implied warranty of
 *   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
 *   GNU General Public License for more details.
 *
 *   You should have received a copy of the GNU General Public License
 *   along with Calamares. If not, see <http://www.gnu.org/licenses/>.
 */

import QtQuick 2.0;
import calamares.slideshow 1.0;

Presentation
{
    id: presentation

    function nextSlide() {
        console.log("QML Component (default slideshow) Next slide");
        presentation.goToNextSlide();
    }

    Timer {
        id: advanceTimer
        interval: 20000
        running: true
        repeat: true
        onTriggered: nextSlide()
    }

    Slide {
        Image {
            id: background_1
            source: "slide_1.png"
            width: 1000; height: 650
            fillMode: Image.PreserveAspectFit
            anchors.centerIn: parent
        }
    }

    Slide {
        Image {
            id: background_2
            source: "slide_2.png"
            width: 1000; height: 650
            fillMode: Image.PreserveAspectFit
            anchors.centerIn: parent
        }
    }

    Slide {
        Image {
            id: background_3
            source: "slide_3.png"
            width: 1000; height: 650
            fillMode: Image.PreserveAspectFit
            anchors.centerIn: parent
        }
    }

    Slide {
        Image {
            id: background_4
            source: "slide_4.png"
            width: 1000; height: 650
            fillMode: Image.PreserveAspectFit
            anchors.centerIn: parent
        }
    }

    Slide {
        Image {
            id: background_5
            source: "slide_5.png"
            width: 1000; height: 650
            fillMode: Image.PreserveAspectFit
            anchors.centerIn: parent
        }
    }

    function onActivate() {
        console.log("QML Component (default slideshow) activated");
        presentation.currentSlide = 0;
    }
    
    function onLeave() {
        console.log("QML Component (default slideshow) deactivated");
    }
}
