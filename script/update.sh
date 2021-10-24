#!/bin/bash -x

sudo apt update
sudo apt upgrade -y
sudo apt autoremove -y

zinit self-update

zinit update --all

anyenv update
