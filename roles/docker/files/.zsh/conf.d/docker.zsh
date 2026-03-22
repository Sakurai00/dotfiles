# Docker Completion
# -----------------------------------------

if [[ ! -f "$ZINIT[COMPLETIONS_DIR]/_docker" ]] && type docker > /dev/null 2>&1; then
    mkdir -p "$ZINIT[COMPLETIONS_DIR]"
    docker completion zsh > "$ZINIT[COMPLETIONS_DIR]/_docker"
fi
