#!/bin/bash -x

function install_docker() {
    # Install Docker
    sudo apt install -y \
        apt-transport-https \
        ca-certificates \
        curl \
        gnupg \
        lsb-release

    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

    osd=get_osd
    if [ $osd = "Ubuntu" ]; then
        echo "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list >/dev/null
    elif [ $osd = "LinuxMint" ]; then
        echo "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(
            . /etc/os-release
            echo "$UBUNTU_CODENAME"
        ) stable" | sudo tee /etc/apt/sources.list.d/docker.list >/dev/null
    fi

    sudo apt update
    sudo apt install -y docker-ce docker-ce-cli containerd.io

    sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
    sudo chmod +x /usr/local/bin/docker-compose
}
