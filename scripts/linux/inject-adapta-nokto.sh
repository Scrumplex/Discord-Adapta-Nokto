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

STYLESHEET_SOURCE="https://rawgit.com/Scrumplex/Discord-Adpata-Nokto/master/stylesheet/adapta-nokto.css"

set -e

# Install asar from via npm
sudo npm install -g asar

# Send SIGUSR1 to Discord to kill
killall -qI -10 Discord || true

# Go to Discord 0.0.4 directory
cd ~/.config/discord/0.0.4/modules/discord_desktop_core

# Backup original asar archive
cp core.asar core.before-patch.asar

# Create temp directory
TMP=$(mktemp -d)

# Extract asar archive to newly created temp directory
asar e core.asar $TMP
# Insert injection script into app/mainScreen.js at line 357
sed -i "357i mainWindow.webContents.executeJavaScript('var elem=document.createElement(\"link\");elem.setAttribute(\"href\",\"$STYLESHEET_SOURCE\"),elem.setAttribute(\"rel\",\"stylesheet\"),document.head.appendChild(elem);');" $TMP/app/mainScreen.js
# Pack the folder again
asar p $TMP core.asar


echo Done! You can now start Discord again.
