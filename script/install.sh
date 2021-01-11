#!/bin/sh -xeu

sudo sed -i.org -e 's|archive.ubuntu.com|ubuntutym.u-toyama.ac.jp|g' /etc/apt/sources.list

sudo apt update


./script/installer/c-cpp.sh

./script/installer/python.sh

./script/installer/rust.sh

./script/installer/go.sh

./script/installer/zsh.sh

./script/installer/neovim.sh

./script/installer/tmux.sh

./script/installer/node.sh