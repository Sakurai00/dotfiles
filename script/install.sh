#!/bin/bash
source "$HOME/dotfiles/script/set_path.sh" && set -x
cd "$DOTDIR" || exit

sudo apt update

install_utillity

install_apt-fast

install_font

install_c-cpp

install_anyenv

install_python

install_rust

install_go

install_cli_tools

install_zsh

install_vim

install_tmux

if (ask_yn "Install Docker? (y/n)"); then
    install_docker
fi

if (ask_yn "Install Ruby? (y/n)"); then
    install_ruby
fi

if ! (is_WSL); then
    if (ask_yn "Install alacritty? (y/n)"); then
        install_alacritty
    fi

    if (ask_yn "Install vscode? (y/n)"); then
        install_vscode
    fi
fi
