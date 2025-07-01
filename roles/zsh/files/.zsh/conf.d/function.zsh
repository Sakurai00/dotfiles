sshls() {
    grep -e ^Host ~/.ssh/config | head -n -1 | sed -e "s/Host //"
}

sshgrep() {
    STRING=$1
    sshls | grep -i $STRING
}
