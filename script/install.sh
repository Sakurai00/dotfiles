#!/bin/sh -xeu

sudo apt update
sudo apt upgrade -y


./installer/git.sh

./installer/c-cpp.sh

./installer/python.sh

./installer/zsh.sh

./installer/nvim.sh

./installer/tmux.sh

./installer/rust.sh