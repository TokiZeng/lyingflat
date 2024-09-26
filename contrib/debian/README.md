
Debian
====================
This directory contains files used to package ftmd/ftm-qt
for Debian-based Linux systems. If you compile ftmd/ftm-qt yourself, there are some useful files here.

## ftm: URI support ##


ftm-qt.desktop  (Gnome / Open Desktop)
To install:

	sudo desktop-file-install ftm-qt.desktop
	sudo update-desktop-database

If you build yourself, you will either need to modify the paths in
the .desktop file or copy or symlink your ftm-qt binary to `/usr/bin`
and the `../../share/pixmaps/ftm128.png` to `/usr/share/pixmaps`

ftm-qt.protocol (KDE)

