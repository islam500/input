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
import "../inputs"

MMDrawerDialog {
  id: root

  property string helpLink: __inputHelp.howToSetupProj

  picture: __style.negativeMMSymbolImage
  bigTitle: qsTr( "PROJ Error" )
  description: __inputUtils.htmlLink(
      qsTr("Learn more about %1how to setup PROJ%2"),
      __style.forestColor,
      root.helpLink
    )
}
