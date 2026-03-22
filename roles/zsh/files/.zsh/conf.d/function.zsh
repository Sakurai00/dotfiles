sshls() {
    grep -e ^Host ~/.ssh/config | sed -e "s/Host //"
}

sshgrep() {
    STRING=$1
    sshls | grep -i $STRING
}
