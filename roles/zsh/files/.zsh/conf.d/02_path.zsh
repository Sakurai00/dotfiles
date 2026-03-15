typeset -U path fpath cdpath

path=(
    $HOME/bin(N-/)
    $HOME/.local/bin(N-/)
    $HOME/.local/lib(N-/)
    $path
)

export PATH
