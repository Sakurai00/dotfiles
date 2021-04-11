#!/bin/sh -xeu

curl https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Regular.ttf -o "MesloLGS NF Regular.ttf"
sudo mv "MesloLGS NF Regular.ttf" /usr/share/fonts
fc-cache -fv