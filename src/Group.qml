/*
    This file is part of QuickQanava library.

    Copyright (C) 2008-2017 Benoit AUTHEMAN

    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with this program.  If not, see <http://www.gnu.org/licenses/>.
*/

//-----------------------------------------------------------------------------
// This file is a part of the QuickQanava software library. Copyright 2015 Benoit AUTHEMAN.
//
// \file	Group.qml
// \author	benoit@destrat.io
// \date	2016 03 22
//-----------------------------------------------------------------------------

import QtQuick              2.7
import QtQuick.Layouts      1.3
import QtGraphicalEffects   1.0

import QuickQanava  2.0 as Qan
import "."          as Qan

Qan.GroupItem {
    id: groupItem
    x: 0;   y: 0; z:0
    width: template.content.width;
    height: template.content.height
    Layout.preferredWidth: 150
    Layout.preferredHeight:  80

    default property alias children : template
    container: template.content   // See qan::GroupItem::container property documentation

    Qan.RectGroupTemplate {
        id: template
        anchors.fill: parent
        groupItem: parent
        Qan.BottomRightResizer {
            id: groupResizer
            x: 0; y: 0; z: 3
            visible: !groupItem.collapsed
            target: template.content
            minimumTargetSize: Qt.size( Math.max( groupItem.Layout.preferredWidth, template.content.childrenRect.x + template.content.childrenRect.width + 10 ),
                                        Math.max( groupItem.Layout.preferredHeight, template.content.childrenRect.y + template.content.childrenRect.height + 10 ) )
        }
    }

    // Emitted by qan::Group when node dragging start
    onNodeDragEnter: { template.onNodeDragEnter() }
    // Emitted by qan::Group when node dragging ends
    onNodeDragLeave: { template.onNodeDragLeave() }
}
