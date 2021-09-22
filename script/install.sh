#!/bin/bash -x
export DOTDIR="$HOME/dotfiles/"
cd "$DOTDIR"
source "$DOTDIR/script/function.sh"


sudo apt update

./script/installer/utility.sh

./script/installer/font.sh

./script/installer/c-cpp.sh

./script/installer/anyenv.sh

./script/installer/python.sh

./script/installer/rust.sh

./script/installer/go.sh

./script/installer/zsh.sh

./script/installer/neovim.sh

./script/installer/tmux.sh

if (ask_yn "Install Docker? (y/n)"); then
    ./script/installer/docker.sh
fi

if (ask_yn "Install Ruby? (y/n)"); then
    ./script/installer/ruby.sh
fi

#./script/installer/node.sh


if ! (is_WSL); then
    if (ask_yn "Install alacritty? (y/n)"); then
        ./script/installer/alacritty.sh
    fi

    if (ask_yn "Install vscode? (y/n)"); then
        ./script/installer/vscode.sh
    fi
fi