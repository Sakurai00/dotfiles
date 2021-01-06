#!/bin/sh -xeu

sudo apt update
sudo apt upgrade -y


./script/installer/git.sh

./script/installer/c-cpp.sh

./script/installer/python.sh

./script/installer/zsh.sh

./script/installer/nvim.sh

./script/installer/tmux.sh

./script/installer/rust.sh

./script/installer/node.sh