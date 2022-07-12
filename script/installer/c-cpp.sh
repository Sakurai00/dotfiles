#!/bin/bash -x

function install_c-cpp() {
    # Install C/C++
    sudo apt install -y build-essential gdb clang lldb cmake
}

function update_c-cpp() {
    # Update C/C++
    sudo apt upgrade -y build-essential gdb clang lldb cmake
}
