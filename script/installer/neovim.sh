#!/bin/bash -x

function install_vim() {
    echo_module_name vim

    # Install vim/neovim
    sudo apt install -y vim neovim

    # Install dein vim
    curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh >installer.sh
    sh ./installer.sh "$HOME/.cache/nvim/dein"
    rm ./installer.sh
}

function update_vim() {
    # Update vim/neovim
    sudo apt upgrade -y vim neovim
}
