#!/bin/bash -x
source ./script/function.sh
echo_module_name vim


# Install vim/neovim
sudo apt install -y vim
sudo apt install -y neovim


# Install dein vim
curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > installer.sh
sh ./installer.sh "$HOME/.cache/nvim/dein"
rm ./installer.sh