#!/bin/sh -xeu

sudo sed -i.bak -e "s%http://[^ ]\+%http://ftp.jaist.ac.jp/pub/Linux/ubuntu/%g" /etc/apt/sources.list

sudo apt update

sudo apt install language-pack-ja

sudo update-locale LANG=ja_JP.UTF-8

sudo ln -sf /usr/share/zoneinfo/Asia/Tokyo /etc/localtime
sudo dpkg-reconfigure --frontend noninteractive tzdata

sudo apt install -y xdg-user-dirs-gtk
LANG=en_US.utf8 xdg-user-dirs-gtk-update

curl https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Regular.ttf -o "MesloLGS NF Regular.ttf"
sudo mv "MesloLGS NF Regular.ttf" /usr/share/fonts
fc-cache -fv