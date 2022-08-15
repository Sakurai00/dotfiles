#!/bin/bash -x
# Requires: snapd

function install_go() {
    # Install Go
    sudo snap install go --classic
}
