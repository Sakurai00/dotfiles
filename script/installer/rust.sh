#!/bin/bash -x

function install_rust() {
    echo_module_name Rust

    # Install Rust
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
    chmod 755 "$HOME/.cargo/env"
    source "$HOME/.cargo/env"

    # Install CLI Tools
    cargo install exa
    sudo apt install -y bat
}

function update_rust() {
    # Update Rust
    rustup update
}
