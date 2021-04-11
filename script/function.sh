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