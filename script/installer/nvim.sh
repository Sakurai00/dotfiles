#!/bin/sh -xeu

sudo apt install -y vim
sudo apt install -y neovim
curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > installer.sh
sh ./installer.sh ~/.cache/nvim/dein
rm -r ~/installer.sh