#!/bin/bash -x

sudo apt install -y gnome-font-viewer

if [ ! -d ~/.local/share/fonts ]; then
    mkdir ~/.local/share/fonts
fi

curl https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Regular.ttf -o "MesloLGS NF Regular.ttf"
sudo mv "MesloLGS NF Regular.ttf" ~/.local/share/fonts
fc-cache -fv
