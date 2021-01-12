#!/bin/sh -xeu


sudo apt update


./script/installer/c-cpp.sh

./script/installer/python.sh

./script/installer/rust.sh

./script/installer/go.sh

./script/installer/zsh.sh

./script/installer/neovim.sh

./script/installer/tmux.sh

./script/installer/node.sh