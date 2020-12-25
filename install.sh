#!/bin/sh

sudo apt update
sudo apt upgrade -y

sudo apt install -y git

sudo apt install -y python3
sudo apt install -y build-essential
sudo apt install -y gdb


# zsh
sudo apt install -y zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/zdharma/zinit/master/doc/install.sh)"


# neovim
sudo apt install -y neovim
curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > installer.sh
sh ./installer.sh ~/.cache/nvim/dein


# tmux
sudo apt install -y tmux


# rust & rust tool (exa, bat)
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
exec $SHELL -l
cargo install exa
sudo apt install -y bat
