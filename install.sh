#!/bin/sh

apt update
apt upgrade -y

apt install -y git

apt install -y python3
apt install -y build-essential
apt install -y gdb


apt install -y zsh
chsh -s $(which zsh)
sh -c "$(curl -fsSL https://raw.githubusercontent.com/zdharma/zinit/master/doc/install.sh)"


apt install -y neovim
curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > installer.sh
sh ./installer.sh ~/.cache/dein

apt install -y tmux

curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -y
cargo install exa
apt install -y bat