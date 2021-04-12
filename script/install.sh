#!/bin/sh -xeu
. ./script/function.sh

sudo apt update

if !(is_exist "curl"); then
    sudo apt install -y curl
fi

if !(is_exist "wget"); then
    sudo apt install -y wget
fi

./script/installer/font.sh

./script/installer/c-cpp.sh

./script/installer/python.sh

./script/installer/rust.sh

./script/installer/go.sh

./script/installer/zsh.sh

./script/installer/neovim.sh

./script/installer/tmux.sh

#./script/installer/node.sh


if !(is_WSL); then
    if (ask_yn "Install alacritty? (y/n)"); then
        ./script/installer/alacritty.sh
    fi

    if (ask_yn "Install vscode? (y/n)"); then
        ./script/installer/vscode.sh
    fi
fi
