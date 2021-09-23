#!/bin/bash -x
source "$DOTDIR/script/function.sh"
echo_module_name rust


# Install Rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
chmod 755 "$HOME/.cargo/env"
source "$HOME/.cargo/env"


# Install CLI Tools
cargo install exa
sudo apt install -y bat