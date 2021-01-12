#!/bin/sh -xeu

sudo sed -i.org -e 's|archive.ubuntu.com|ubuntutym.u-toyama.ac.jp|g' /etc/apt/sources.list

sudo apt update

sudo apt install language-pack-ja

sudo update-locale LANG=ja_JP.UTF-8

sudo ln -sf /usr/share/zoneinfo/Asia/Tokyo /etc/localtime
sudo dpkg-reconfigure --frontend noninteractive tzdata

sudo apt install -y xdg-user-dirs-gtk
LANG=en_US.utf8 xdg-user-dirs-gtk-update
