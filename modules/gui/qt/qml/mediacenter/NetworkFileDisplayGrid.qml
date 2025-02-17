/*****************************************************************************
 * Copyright (C) 2019 VLC authors and VideoLAN
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 2 of the License, or
 * ( at your option ) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston MA 02110-1301, USA.
 *****************************************************************************/
import QtQuick 2.11
import QtQuick.Controls 2.4
import QtQml.Models 2.2

import org.videolan.medialib 0.1

import "qrc:///utils/" as Utils
import "qrc:///style/"

Utils.GridItem {
    id: item

    pictureWidth: VLCStyle.network_normal
    pictureHeight: VLCStyle.network_normal
    image: "qrc:///type/file_black.svg"
    subtitle: model.name || qsTr("Unknown share")
    title: model.mrl
    focus: true

    selected: element.DelegateModel.inSelected
    shiftX: view.currentItem.shiftX(model.index)
    onItemClicked : {
        if (key == Qt.RightButton){
            contextMenu.model = model
            contextMenu.popup(menuParent)
        }
        delegateModel.updateSelection( modifier , view[viewIndexPropertyName], index)
        view[viewIndexPropertyName] = index
        item.forceActiveFocus()
    }
    showContextButton: true

    onItemDoubleClicked: {
        medialib.addAndPlay( model.mrl )
    }
    onPlayClicked: {
        medialib.addAndPlay( model.mrl )
    }
    onAddToPlaylistClicked: {
        medialib.addToPlaylist( model.mrl );
    }
    onContextMenuButtonClicked: {
        contextMenu.model = model
        contextMenu.popup(menuParent)
    }
}
