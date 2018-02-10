#!/usr/bin/env bash

# Send SIGUSR1 to Discord to kill
killall -qI -10 Discord

# Go to Discord 0.0.4 directory
cd ~/.config/discord/0.0.4/modules/discord_desktop_core

# Restore previously backed up asar archive
mv core.before-patch.asar core.asar

echo Original has been restored. You can now start Discord again.
