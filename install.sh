#!/bin/bash

echo "Installing required packages"
sudo pacman -Syu --needed \
	alacritty \
	arandr \
	autorandr \
	blueman \
	cowsay \
	dunst \
    neofetch \
	neovim \
	networkmanager \
	network-manager-applet \
	nitrogen \
	pavucontrol \
	picom \
	python-dbus-next \
	python-pywlroots \
	qtile \
	rofi \
	stow \
	ttf-jetbrains-mono\
	xorg-xbacklight

echo "Creating symlinks"
stow alacritty
stow dunst
stow nvim
stow picom
stow qtile
stow rofi

echo "Installing vim-plug"
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
	       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'


cowsay "Done"

