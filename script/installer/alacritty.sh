#!/bin/bash -x
#rq git, rust
. ./script/function.sh

if [ ! -d ~/alacritty ]; then
    git clone https://github.com/alacritty/alacritty.git ~/alacritty
fi
cd ~/alacritty || exit

rustup override set stable
rustup update stable

sudo apt install -y cmake pkg-config libfreetype6-dev libfontconfig1-dev libxcb-xfixes0-dev python3

cargo build --release

sudo tic -xe alacritty,alacritty-direct extra/alacritty.info

if ! (is_WSL); then
    sudo cp target/release/alacritty /usr/local/bin
    sudo cp extra/logo/alacritty-term.svg /usr/share/pixmaps/Alacritty.svg
    sudo desktop-file-install extra/linux/Alacritty.desktop
    sudo update-desktop-database
fi

sudo mkdir -p /usr/local/share/man/man1
gzip -c extra/alacritty.man | sudo tee /usr/local/share/man/man1/alacritty.1.gz > /dev/null

mkdir -p ${ZDOTDIR:-~}/.zsh_functions
cp extra/completions/_alacritty ${ZDOTDIR:-~}/.zsh_functions/_alacritty