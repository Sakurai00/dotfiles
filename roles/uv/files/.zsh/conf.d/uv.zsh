# ====== Load uv ======
if [ -d "$HOME/.local/bin/uv" ] ; then
  eval "$(uv generate-shell-completion zsh)"
  eval "$(uvx --generate-shell-completion zsh)"
fi
# ====== ====== ======
