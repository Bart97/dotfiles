#!/bin/bash

echo "Installing required packages"
sudo pacman -Syu --needed stow qtile alacritty neovim cowsay dunst picom rofi arandr autorandr ttf-jetbrains-mono

echo "Creating symlinks"
stow alacritty
stow dunst
stow nvim
stow picom
stow qtile
stow rofi

cowsay "Done"

