#!/bin/bash -x

function install_tmux() {
    # Install tmux
    sudo apt install -y tmux

    # Install tpm
    if [ ! -d "$HOME/.tmux/plugins/tpm" ]; then
        git clone https://github.com/tmux-plugins/tpm "$HOME/.tmux/plugins/tpm"
    else
        cd "$HOME/.tmux/plugins/tpm" || exit
        git pull
    fi
}

function update_tmux() {
    # Update tmux
    sudo apt upgrade -y tmux

    # Update tpm
    cd "$HOME/.tmux/plugins/tpm" || exit
    git pull
}
