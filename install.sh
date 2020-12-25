#!/bin/sh

sudo apt update
sudo apt upgrade -y

sudo apt install -y git

sudo apt install -y python3
sudo apt install -y build-essential
sudo apt install -y gdb


sudo apt install -y zsh
chsh -s $(which zsh)
sh -c "$(curl -fsSL https://raw.githubusercontent.com/zdharma/zinit/master/doc/install.sh)"


sudo apt install -y neovim
curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > installer.sh
sh ./installer.sh ~/.cache/dein

sudo apt install -y tmux

curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
cargo install exa
sudo apt install -y bat