#!/bin/bash -x

if (ask_yn "Change source? (y/n)"); then
    sudo sed -i.bak -e 's%http://[^ ]\+%mirror://mirrors.ubuntu.com/mirrors.txt%g' /etc/apt/sources.list
fi

sudo apt update

sudo apt install language-pack-ja

sudo update-locale LANG=ja_JP.UTF-8

sudo ln -sf /usr/share/zoneinfo/Asia/Tokyo /etc/localtime
sudo dpkg-reconfigure --frontend noninteractive tzdata

sudo apt install -y xdg-user-dirs-gtk
LANG=en_US.utf8 xdg-user-dirs-gtk-update
