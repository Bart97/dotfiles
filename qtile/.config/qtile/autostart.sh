#!/usr/bin/env bash

picom &
nm-applet &
autorandr --change &
blueman-applet &
nitrogen --restore
dunst &
test -x /usr/lib/pam_kwallet_init && /usr/lib/pam_kwallet_init &
mpris-proxy &

