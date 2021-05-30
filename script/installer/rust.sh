#!/bin/bash -x
. ./script/function.sh

echo_module_name rust

curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y

chmod 755 ~/.cargo/env
. ~/.cargo/env

cargo install exa

sudo apt install -y bat
