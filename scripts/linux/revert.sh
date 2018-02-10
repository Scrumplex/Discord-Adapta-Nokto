#!/usr/bin/env bash

# Send SIGUSR1 to Discord to kill
killall -qI -10 Discord

cd ~/.config/discord/0.0.4/modules/discord_desktop_core

mv core.before-patch.asar core.asar