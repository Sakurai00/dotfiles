#!/bin/bash -x
source ./script/function.sh
echo_module_name fonts


sudo apt install -y gnome-font-viewer

if [ ! -d "$HOME/.local/share/fonts" ]; then
    mkdir "$HOME/.local/share/fonts"
fi

if [ ! -d "$HOME/dotfiles/fonts/font" ]; then
    mkdir -p "$HOME/dotfiles/fonts/font"
fi

curl -L https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Regular.ttf -o "$HOME/dotfiles/fonts/font/MesloLGS NF Regular.ttf"

curl -L https://github.com/adobe-fonts/source-han-code-jp/archive/refs/tags/2.012R.tar.gz -o "$HOME/dotfiles/fonts/source-han-code.tar.gz"
tar -zxvf ~/dotfiles/fonts/source-han-code.tar.gz -C ~/dotfiles/fonts/
cp ~/dotfiles/fonts/source-han-code-jp-2.012R/OTF/* ~/dotfiles/fonts/font


cp ~/dotfiles/fonts/font/* ~/.local/share/fonts
fc-cache -fv
