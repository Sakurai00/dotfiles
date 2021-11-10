#!/bin/bash -x

function install_rust() {
    echo_module_name Rust

    # Install Rust
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
    chmod 755 "$HOME/.cargo/env"
    source "$HOME/.cargo/env"

    # Install cargo-update
    cargo install cargo-update
}

function update_rust() {
    # Update Rust
    rustup update

    # Update cargo package
    cargo install-update -a
}
