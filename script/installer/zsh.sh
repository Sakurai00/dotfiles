#!/bin/sh -xeu

sudo apt install -y zsh
yes | sh -c "$(curl -fsSL https://raw.githubusercontent.com/zdharma/zinit/master/doc/install.sh)"
