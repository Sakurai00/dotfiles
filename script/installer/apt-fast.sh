#!/bin/bash -x

function install_apt-fast() {
    echo_module_name apt-fast

    # Install apt-fast
    # https://github.com/ilikenwf/apt-fast
    /bin/bash -c "$(curl -sL https://git.io/vokNn)"
    alias apt="apt-fast"
}
