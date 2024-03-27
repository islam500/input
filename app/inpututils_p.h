/***************************************************************************
 *                                                                         *
 *   This program is free software; you can redistribute it and/or modify  *
 *   it under the terms of the GNU General Public License as published by  *
 *   the Free Software Foundation; either version 2 of the License, or     *
 *   (at your option) any later version.                                   *
 *                                                                         *
 ***************************************************************************/

#ifndef INPUTUTILS_P_H
#define INPUTUTILS_P_H

#include <QColor>
#include <QString>

namespace InputUtilsPrivate
{
  QString htmlLink( const QString &text,
                    const QColor &color,
                    const QString &url = "internal-signal",
                    const QString &url2 = "",
                    bool underline = true,
                    bool bold = true
                  );

};

#endif // INPUTUTILS_P_H
