#!/bin/bash -x
# Requires: Go

function install_lazygit() {
    # Install Requirements
    if ! (is_exist "go"); then
        install_go
    fi

    # Install lazygit
    # https://github.com/jesseduffield/lazygit
    go get github.com/jesseduffield/lazygit
}

function update_lazygit() {
    # Update lazygit
    go get -u github.com/jesseduffield/lazygit
}
