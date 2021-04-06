#!/bin/sh -xeu


sudo apt update


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