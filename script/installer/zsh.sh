#!/bin/bash -x

sudo apt install -y zsh
yes | sh -c "$(curl -fsSL https://raw.githubusercontent.com/zdharma/zinit/master/doc/install.sh)"
rm ~/.zshrc

chsh -s $(which zsh)
