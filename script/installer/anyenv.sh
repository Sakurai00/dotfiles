#!/bin/bash -x
echo_module_name anyenv

# Install anyenv
if [ ! -d "$HOME/.anyenv" ]; then
    git clone https://github.com/anyenv/anyenv "$HOME/.anyenv"
fi

source "$HOME/.zshenv"

"$HOME/.anyenv/bin/anyenv" init
anyenv install --init

# Install anyenv update
if [ ! -d "$(anyenv root)/plugins" ]; then
    mkdir -p "$(anyenv root)/plugins"
fi

if [ ! -d "$(anyenv root)/plugins/anyenv-update" ]; then
    git clone https://github.com/znz/anyenv-update.git "$(anyenv root)/plugins/anyenv-update"
fi
