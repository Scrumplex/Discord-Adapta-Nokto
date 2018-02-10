#!/usr/bin/env bash
#    Discord-Adapta-Nokto
#    Copyright (C) 2018 Sefa Eyeoglu <contact@scrumplex.net> (https://scrumplex.net)
#
#    This program is free software: you can redistribute it and/or modify
#    it under the terms of the GNU General Public License as published by
#    the Free Software Foundation, either version 3 of the License, or
#    (at your option) any later version.
#
#    This program is distributed in the hope that it will be useful,
#    but WITHOUT ANY WARRANTY; without even the implied warranty of
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#    GNU General Public License for more details.
#
#    You should have received a copy of the GNU General Public License
#    along with this program.  If not, see <https://www.gnu.org/licenses/>.

set -e
sudo npm install -g asar

# Send SIGUSR1 to Discord to kill
killall -qI -10 Discord || true

cd ~/.config/discord/0.0.4/modules/discord_desktop_core

cp core.asar core.before-patch.asar

TMP=$(mktemp -d)
asar e core.asar $TMP
sed -i "121i _mainWindow\$webConten.executeJavaScript('var elem=document.createElement(\"link\");elem.setAttribute(\"href\",\"https://cdn.rawgit.com/Scrumplex/Discord-Adpata-Nokto/master/stylesheet/adapta-nokto.css\"),elem.setAttribute(\"rel\",\"stylesheet\"),document.head.appendChild(elem);');" $TMP/app/mainScreen.js
asar p $TMP core.asar
echo Done! You can now start Discord again.
