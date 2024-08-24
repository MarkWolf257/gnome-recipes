#!/bin/bash

sudo pacman -Syu --noconfirm xorg-server gnome-shell gdm alacritty gnome-control-center gnome-shell-extensions gnome-tweaks gnome-shell-extension-caffeine gnome-shell-extension-vitals ttf-jetbrains-mono-nerd neovim

mkdir AURs
cd AURs

aurs=("text-engine" "extension-manager" "gnome-shell-extension-blur-my-shell" "gnome-shell-extension-forge" "zen-browser-optimized-bin")

for aur in ${aurs[@]}
do
	git clone https://aur.archlinux.org/$aur.git
	cd $aur
	makepkg --noconfirm -si
	cd ..
done

cd ..

extensions=("user-theme@gnome-shell-extensions.gcampax.github.com" "blur-my-shell@aunetx" "caffeine@patapon.info" "Vitals@CoreCoding.com" "forge@jmmaranan.com") 

for extension in ${extensions[@]}
do
	gnome-extensions enable $extension
done

sudo systemctl enable gdm.service
reboot
