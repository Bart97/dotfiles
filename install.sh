#!/bin/bash

echo "Installing required packages"
sudo pacman -Syu --needed \
	alacritty \
	arandr \
	autorandr \
	blueman \
	cowsay \
	dunst \
	neovim \
	networkmanager \
	nitrogen \
	picom \
	python-dbus-next \
	python-pywlroots \
	qtile \
	rofi \
	stow \
	ttf-jetbrains-mono

echo "Creating symlinks"
stow alacritty
stow dunst
stow nvim
stow picom
stow qtile
stow rofi

cowsay "Done"

