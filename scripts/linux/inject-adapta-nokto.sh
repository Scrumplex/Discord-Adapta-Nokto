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

STYLESHEET_SOURCE="https://cdn.rawgit.com/Scrumplex/Discord-Adpata-Nokto/$(curl -s -H 'Accept: application/vnd.github.VERSION.sha' https://api.github.com/repos/Scrumplex/Discord-Adpata-Nokto/commits/HEAD)/stylesheet/adapta-nokto.css"

# Install asar from via npm if not installed
if ! [ -x "$(command -v asar)" ]
then
    if [ -x "$(command -v npm)" ]
    then
        sudo npm install -g asar
    else
        >&2 echo "npm not installed! Can't continue."
        exit 1
    fi
fi

# Kill Discord
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
