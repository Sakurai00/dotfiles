#!/bin/bash -x
# Requires: Git, Rust, python
echo_module_name alacritty

# Install Requirements
if ! (is_exist "git"); then
    ./script/installer/utility.sh
elif ! (is_exist "rustup"); then
    ./script/installer/rust.sh
elif ! (is_exist "python3"); then
    ./script/installer/python.sh
fi

# Install Alacritty
if [ ! -d "$HOME/alacritty" ]; then
    git clone https://github.com/alacritty/alacritty.git "$HOME/alacritty"
    cd "$HOME/alacritty" || exit
else
    cd "$HOME/alacritty" || exit
    git pull
fi

rustup override set stable
rustup update stable

sudo apt install -y cmake pkg-config libfreetype6-dev libfontconfig1-dev libxcb-xfixes0-dev

cargo build --release

sudo tic -xe alacritty,alacritty-direct extra/alacritty.info

if ! (is_WSL); then
    sudo cp target/release/alacritty /usr/local/bin
    sudo cp extra/logo/alacritty-term.svg /usr/share/pixmaps/Alacritty.svg
    sudo desktop-file-install extra/linux/Alacritty.desktop
    sudo update-desktop-database
fi

sudo mkdir -p /usr/local/share/man/man1
gzip -c extra/alacritty.man | sudo tee /usr/local/share/man/man1/alacritty.1.gz >/dev/null
