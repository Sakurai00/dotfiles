#!/bin/bash -x
echo_module_name utillity

if ! (is_exist "curl"); then
    sudo apt install -y curl
fi

if ! (is_exist "wget"); then
    sudo apt install -y wget
fi

sudo apt install -y neofetch

sudo apt install -y unzip

sudo apt install -y git
