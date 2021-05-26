#!/bin/bash
. ./script/function.sh

echo_module_name tmux

sudo apt install -y tmux

if [ ! -d ~/.tmux/plugins/tpm ]; then
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
fi