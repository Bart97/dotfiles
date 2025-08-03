#!/bin/bash

echo "Installing required packages"
sudo pacman -Syu --needed \
    blueman \
    networkmanager \
    network-manager-applet \
    playerctl \
    rofi \
    pavucontrol \
    screen \
    pipewire \
    wireplumber \
    pipewire-pulse \
    pipewire-audio \



echo "Installing terminal tools"
sudo pacman -Syu --needed \
    stow \
    ripgrep \
    neovim \
    rsync \
    neofetch \



echo "Installing desktop environment"
sudo pacman -Syu --needed \
    wayland \
    wl-clipboard \
    xorg-xwayland \
    alacritty \
    hyprland \
    brightnessctl \
    uwsm \
    ttf-jetbrains-mono \
    dunst \
    waybar \
    rofi-wayland \
    noto-fonts-emoji \
    slurp
    

echo "Installing productivity tools"
sudo pacman -Syu --needed \
    telegram-desktop \
    signal-desktop \
    libreoffice \
    discord \
    vlc vlc-plugins-all \
    thunar thunar-archive-plugin thunar-shares-plugin thunar-media-tags-plugin thunar-volman \
    sane sane-airscan tesseract-data-pol skanpage \
    gnome-keyring seahorse \
    okular


echo "Creating symlinks"
stow alacritty
stow dunst
stow nvim
stow hyperland
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

echo "Done"

