#!/bin/sh -x
. ./script/function.sh

if !(is_exist "curl"); then
    sudo apt install -y curl
fi

if !(is_exist "wget"); then
    sudo apt install -y wget
fi

sudo apt install -y neofetch
