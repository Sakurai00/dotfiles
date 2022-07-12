#!/bin/bash -x

function install_zsh() {
    # Install zsh
    sudo apt install -y zsh
}

function update_zsh() {
    # Update zsh
    sudo apt upgrade -y zsh

    # Update zinit
    cd "$HOME/.zinit/bin" || exit
    git pull

    zinit self-update
    zinit update --all
}
