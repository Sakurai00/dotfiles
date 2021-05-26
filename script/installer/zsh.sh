#!/bin/bash
. ./script/function.sh

echo_module_name zsh

sudo apt install -y zsh
yes | sh -c "$(curl -fsSL https://raw.githubusercontent.com/zdharma/zinit/master/doc/install.sh)"
if [ -d ~/.zshrc ]; then
    rm ~/.zshrc
fi

#chsh -s $(which zsh)
