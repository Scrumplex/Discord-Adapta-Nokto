Discord-Adapta-Nokto
====================
A theme patch for Discord on Linux.

# Screenshots
![Chat](screenshots/chat.png)
![Friends](screenshots/friends.png)
![User Popup (Default)](screenshots/popup.png)
![User Popup (Playing)](screenshots/popup_playing.png)

# Support
For now this patch officially supports Discord 0.0.4 on Linux.

# Patcher
## Installation
1. Download the **dc-patcher** script [here](scripts/linux/dc-patcher).
2. Run `$ chmod +x dc-patcher` in the containing directory.
3. Run `$ ./dc-patcher` to install.

One liner:
```bash
$ bash <(wget -qO- https://raw.githubusercontent.com/Scrumplex/Discord-Adpata-Nokto/master/scripts/linux/dc-patcher)
```

## Configuration options
There are some configuration options for the patcher. Just run `$ ./dc-patcher -h` for more info.

## Upgrade
The upgrade process is the same as the [installation](#Installation)

## Uninstall
1. Download the **dc-patcher** script [here](scripts/linux/dc-patcher).
2. Run `$ chmod +x dc-patcher` in the containing directory.
3. Run `$ ./dc-patcher -u` to uninstall.

One liner:
```bash
$ bash <(wget -qO- https://raw.githubusercontent.com/Scrumplex/Discord-Adpata-Nokto/master/scripts/linux/dc-patcher) -u
```

# Status

 - [x] Theme main UI (guilds-list, friends-list, channel-list, chat, ...)
 - [x] Theme context-menu
 - [x] Theme settings
 - [ ] Theme dialogs / modals
 - [x] Theme start screen
 - [ ] Add support for other OS (presumably with BetterDiscord)
 - [ ] Add Adapta (Light) theme

# License
This project is licensed under the GNU General Public License v3. You can find more information about it in the [LICENSE](LICENSE) file.