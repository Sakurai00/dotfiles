#!/bin/sh -x

curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y

chmod 755 ~/.cargo/env
. ~/.cargo/env

cargo install exa

sudo apt install -y bat
