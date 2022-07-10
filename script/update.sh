#!/bin/bash
source "$HOME/dotfiles/script/set_path.sh" && set -x
cd "$DOTDIR" || exit

sudo apt update
sudo apt upgrade -y
sudo apt autoremove -y

update_c-cpp

update_anyenv

update_python

update_rust

update_go

update_cli_tools

update_lazygit

update_zsh

update_vim

update_tmux

cd "$DOTDIR" || exit
