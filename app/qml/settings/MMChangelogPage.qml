/***************************************************************************
 *                                                                         *
 *   This program is free software; you can redistribute it and/or modify  *
 *   it under the terms of the GNU General Public License as published by  *
 *   the Free Software Foundation; either version 2 of the License, or     *
 *   (at your option) any later version.                                   *
 *                                                                         *
 ***************************************************************************/

import QtQuick

import "../components"
import "./components" as MMSettingsComponents

MMPage {
  id: root

  property var model /* ChangelogModel */
  property bool dataNotReady: root.model ? ( root.model.count === 0 || root.model.isLoading ) : true

  pageHeader.title: qsTr( "Changelog" )
  pageBottomMarginPolicy: MMPage.BottomMarginPolicy.PaintBehindSystemBar

  pageContent: MMListView {
    width: parent.width
    height: parent.height

    spacing: __style.spacing20

    model: root.model

    header: MMSettingsComponents.MMChangelogEntryDelegate {
      width: ListView.view.width

      title: qsTr( "What's new" )
      description: qsTr( "See what changed since you were last here." )
      hasLine: false
    }

    delegate: MMSettingsComponents.MMChangelogEntryDelegate {
      width: ListView.view.width

      title: model.title
      datetime: root.formatDate( model.date )
      description: model.description

      onClicked: Qt.openUrlExternally( model.link )
    }

    footer: root.dataNotReady ? noItemDelegate : spacer
  }

  Component {
    id: spacer
    MMListFooterSpacer {}
  }

  Component {
    id: noItemDelegate
    Item {
      width: ListView.view.width
      height: indicator.height + __style.spacing40

      MMBusyIndicator {
        id: indicator
        anchors.centerIn: parent
        running: true
      }
    }
  }

  function formatDate( d ) {

    // TODO: Could be moved to C++

    if ( d instanceof Date ) {
      return Qt.locale().dayName( d.getDay(), Locale.ShortFormat ) + ", " + d.getDate() + " " + Qt.locale().monthName( d.getMonth(), Locale.LongFormat )
    }
    else {
      return d
    }
  }
}
