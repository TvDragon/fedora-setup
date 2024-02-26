<h1 align="center">Polar Space</h1>

Polar Space is a minimialistic Linux setup for Fedora using the Gruvbox Dark B Theme. This setup uses BSPWM as the window manager.

## Screenshots of the Desktop
### 1) Home Screen BSPWM
![desktop-bspwm](https://github.com/TvDragon/fedora-setup/assets/67213501/f4a9847e-49a5-4268-935c-0fcb2bfd3c9c)

### 2) Tiles
![fedora-bspwm](https://github.com/TvDragon/fedora-setup/assets/67213501/b99db80d-7d82-4350-9db5-4901d71ccbc7)

## Dependencies for BSPWM
- bspwm
- sxhkd
- polybar
- picom
- rofi
- xfce4-terminal

## Dependencies for XFWM4
- xfwm4
- xfce4-settings
- xfce4-panel
- xfce4-whiskermenu
- xfce4-terminal

## Installation Steps (Fedora Server netinst.iso)
**NOTE:** This guide uses ``~/`` as the default path for cloning repos

1. First you will need to use the debian server netinst iso image which can be installed from:

* [![Fedora][fedora]][Fedora-url]

2. Flash fedora server netinst onto a usb and install the system onto your drive.
3. Update your repositories:

		sudo dnf update
4. Upgrade your system:

		sudo dnf upgrade
5. Optional Changes for changing terminal emulator

	Before running the script you may wish to use a different terminal emulator. If so, then open up ``setup.sh`` script and change xfce4-terminal to your desired terminal emulator.

	- BSPWM

		After running step 6, reboot the system and go to keyboard shortcuts to change which terminal to open by default when entering the commands for Ctrl + Alt + t.
6. Run the ``setup.sh`` script:

		sh setup.sh

[fedora]: https://img.shields.io/badge/Fedora-FFFFFF?style=for-the-badge&logo=fedora&logoColor=#51A2DA
[Fedora-url]: [https://www.debian.org/](https://fedoraproject.org/server/download)https://fedoraproject.org/server/download
