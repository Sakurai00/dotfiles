#!/bin/bash -x

function install_anyenv() {
    echo_module_name anyenv

    # Install anyenv
    if [ ! -d "$HOME/.anyenv" ]; then
        git clone https://github.com/anyenv/anyenv "$HOME/.anyenv"
    else
        cd "$HOME/.anyenv" || exit
        git pull
    fi

    source "$DOTDIR/.zshenv"

    "$HOME/.anyenv/bin/anyenv" init
    anyenv install --init

    # Install anyenv update
    if [ ! -d "$(anyenv root)/plugins" ]; then
        mkdir -p "$(anyenv root)/plugins"
    fi

    if [ ! -d "$(anyenv root)/plugins/anyenv-update" ]; then
        git clone https://github.com/znz/anyenv-update.git "$(anyenv root)/plugins/anyenv-update"
    else
        cd "$(anyenv root)/plugins/anyenv-update" || exit
        git pull
    fi
}

function update_anyenv() {
    anyenv update
}