#!/bin/bash

ask_yn() {
    while true; do
        read -p "$1 " yn
        case $yn in
            [Yy]* ) return 0;;
            [Nn]* ) return 1;;
            * ) continue;;
        esac
    done
}

is_exist() {
    type "$1" > /dev/null 2>&1
    return $?
}

is_WSL() {
    if [ -e /proc/sys/fs/binfmt_misc/WSLInterop ]; then
        return 0
    else
        return 1
    fi
}

echo_module_name() {
    name=$1
    ESC=$(printf '\033')
    printf "\n\n"
    echo "====== ${ESC}[1;97;49m ${name} ${ESC}[m ======"
    printf "\n"
}

get_osd() {
    if [ -e /etc/lsb-release ]; then
        if grep -q "Ubuntu" /etc/lsb-release ; then
            osd="Ubuntu"
        elif grep -q "LinuxMint" /etc/lsb-release ; then
            osd="LinuxMint"
        fi
    fi
    echo $osd
}