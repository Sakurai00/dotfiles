#!/bin/bash
. ./script/function.sh

echo_module_name vim

sudo apt install -y vim

sudo apt install -y neovim

curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > installer.sh
sh ./installer.sh ~/.cache/nvim/dein
rm ./installer.sh