#!/bin/bash

# update the new installed system.
sudo pacman -Syyu

# install git and make
sudo pacman -S make gcc

# install paru from aur git link
cd ..
mkdir .config
cd .config
git clone https://aur.archlinux.org/paru.git
cd paru
makepkg -si
cd ..
rm -rf paru
cd ..

# install dwm dependencies
paru -S xorg-server xorg-apps libx11 libxinerama libxft webkit2gtk xf86-video-intel nvidia optimus-manager bbswitch optimus-manager-qt

# install browser, editor, file manager, video player etc.
paru -S brave geany thunar tumbler vlc picom nitrogen alacritty rofi zsh neofetch sxhkd

# install and enable lightdm
paru -S ly
sudo systemctl enable ly.service

# clone and compile dwm, st and dmenu
cd .config
git clone git://git.suckless.org/dwm
git clone git://git.suckless.org/st
git clone git://git.suckless.org/dmenu
cd dmenu
sudo make clean install
cd ..
cd st
sudo make clean install
cd ..
cd dwm
sudo make clean install
cd /home/mortician

# config.h - autostart.sh - picom.conf - sxhkdrc - .zshrc - dwm.desktop
# clone config files and autostart to home directory, and copy them to their places
 
sudo cp /home/mortician/Dwm-MG/config.h /home/mortician/.config/dwm/config.h
cd /home/mortician/.config/dwm/
sudo make clean install
cp /home/mortician/Dwm-MG/autostart.sh /home/mortician/.config/dwm/autostart.sh
chmod 755 autostart.sh
cp /home/mortician/Dwm-MG/zshrc /home/mortician/.zshrc
cd ..
mkdir picom
mkdir sxhkd
cp /home/mortician/Dwm-MG/picom.conf /home/mortician/.config/picom/picom.conf
cp /home/mortician/Dwm-MG/sxhkdrc /home/mortician/.config/sxhkd/sxhkdrc
cd /usr/share/
sudo mkdir xsessions
sudo cp /home/mortician/Dwm-MG/dwm.desktop /usr/share/xsessions/dwm.desktop

# change default user shell to zsh

echo "Enter user password to change shell"
echo
chsh -s /usr/bin/zsh

#reboot the system

sudo reboot

