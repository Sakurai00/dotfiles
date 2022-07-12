#!/bin/bash -x
# Requires: Rust

function install_cli_tools() {
    # Install Requirements
    if ! (is_exist "rustup"); then
        install_rust
    fi

    # Install CLI Tools
    cargo install exa
    cargo install git-delta
    sudo apt install -y bat
}

function update_cli_tools() {
    # Update cargo package
    cargo install-update -a
}
