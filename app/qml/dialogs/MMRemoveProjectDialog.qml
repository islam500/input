/***************************************************************************
 *                                                                         *
 *   This program is free software; you can redistribute it and/or modify  *
 *   it under the terms of the GNU General Public License as published by  *
 *   the Free Software Foundation; either version 2 of the License, or     *
 *   (at your option) any later version.                                   *
 *                                                                         *
 ***************************************************************************/

import QtQuick
import QtQuick.Controls

import "../components"
import "../inputs"

MMDrawerDialog {
  id: root

  property string relatedProjectId: ""

  signal removeClicked()

  picture: __style.negativeMMSymbolImage
  bigTitle: qsTr( "Remove project" )
  description: qsTr( "Any unsynchronized changes will be lost in project \n %1" ).arg( relatedProjectId )
  primaryButton: qsTr("Remove")
  secondaryButton: qsTr("Cancel")

  onPrimaryButtonClicked: {
    removeClicked()
    close()
  }

  onSecondaryButtonClicked: {
    root.relatedProjectId = ""
    close()
  }
}