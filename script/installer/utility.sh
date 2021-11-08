#!/bin/bash -x

function install_utillity() {
    echo_module_name utillity

    # Install utils
    sudo apt install -y curl wget git

    sudo apt install -y unzip

    sudo apt install -y neofetch
}
