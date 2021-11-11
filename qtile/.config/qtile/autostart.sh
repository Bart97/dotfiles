#!/usr/bin/env bash

picom &
nm-applet &
autorandr --change &
blueman-applet &
nitrogen --restore
dunst &

