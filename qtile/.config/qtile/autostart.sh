#!/usr/bin/env bash

picom &
nm-applet &
autorandr --change &
blueman-applet &
nitrogen --restore
dunst &
test -x /usr/lib/pam_kwallet_init && /usr/lib/pam_kwallet_init &
mpris-proxy &
playerctld daemon
command -v telegram-desktop &> /dev/null && telegram-desktop -startintray &
command -v signal-desktop&> /dev/null && signal-desktop --start-in-tray &
flameshot &

