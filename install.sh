#!/bin/bash

echo "Installing required packages"
sudo pacman -Syu --needed \
    acpilight \
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
    playerctl \
	python-dbus-next \
	python-pywlroots \
	qtile \
	rofi \
	stow \
    thunar
    thunar-archive-plugin
    thunar-media-tags-plugin
    thunar-volman
	ttf-jetbrains-mono\

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

echo "Setting Alacritty as the default terminal"
gsettings set org.gnome.desktop.default-applications.terminal exec-arg '-e'
gsettings set org.gnome.desktop.default-applications.terminal exec 'alacritty'
# Ugly hack to force GLib to detect Alacritty as one of their hardcoded terminals
# https://github.com/frida/glib/blob/main/gio/gdesktopappinfo.c
sudo ln -s /bin/alacritty /bin/tilix

echo "Configuring acpilight permissions"
sudo cp ./90-backlight.rules /etc/udev/rules.d/90-backlight.rules
sudo usermod -a -G video $USER

cowsay "Done"

