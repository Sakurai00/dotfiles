#!/bin/bash -x

function install_c-cpp() {
    echo_module_name C/C++

    # Install C/C++
    sudo apt install -y build-essential gdb
}

function update_c-cpp() {
    # Update C/C++
    sudo apt upgrade -y build-essential gdb
}
