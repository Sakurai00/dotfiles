#!/bin/sh -xeu

curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
source .bashrc
cargo install exa

sudo apt install -y bat