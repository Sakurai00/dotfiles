#!/bin/sh -xeu


sudo apt update

if !(type curl > /dev/null 2>&1); then
    sudo apt install -y curl
fi

if !(type wget > /dev/null 2>&1); then
    sudo apt install -y wget
fi

# font install
curl https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Regular.ttf -o "MesloLGS NF Regular.ttf"
sudo mv "MesloLGS NF Regular.ttf" /usr/share/fonts
fc-cache -fv


./script/installer/c-cpp.sh

./script/installer/python.sh

./script/installer/rust.sh

./script/installer/go.sh

./script/installer/zsh.sh

./script/installer/neovim.sh

./script/installer/tmux.sh

#./script/installer/node.sh


read -n1 -p "Install alacritty? (y/N): " yn
if [[ $yn = [yY] ]]; then
  ./script/installer/alacritty.sh
fi

read -n1 -p "Install vscode? (y/N): " yn
if [[ $yn = [yY] ]]; then
  ./script/installer/vscode.sh
fi