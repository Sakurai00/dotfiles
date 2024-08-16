# link to $ZDOTDIR/plugin/fzf.zsh


# Auto-completion
# ---------------
[[ $- == *i* ]] && source "$HOME/.fzf/shell/completion.zsh" 2> /dev/null


# Key bindings
# ------------
source "$HOME/.fzf/shell/key-bindings.zsh"
source <(fzf --zsh)


if type rg > /dev/null 2>&1; then
    export FZF_DEFAULT_COMMAND='rg --files --hidden --follow --glob "!.git"'
else
    export FZF_DEFAULT_COMMAND='find * -type f'
fi

export FZF_DEFAULT_OPTS='--height 40% --layout=reverse --border'

if type bat > /dev/null 2>&1; then
    export FZF_CTRL_R_OPTS="
        --preview 'echo {}' --preview-window up:3:hidden:wrap
        --bind 'ctrl-/:toggle-preview'
        --bind 'ctrl-y:execute-silent(echo -n {2..} | pbcopy)+abort'
        --color header:italic
        --header 'Press CTRL-Y to copy command into clipboard'"
    export FZF_CTRL_T_OPTS="
        --preview 'bat -n --color=always {}'
        --bind 'ctrl-/:change-preview-window(down|hidden|)'"
fi

export FZF_ALT_C_OPTS="--preview 'tree -C {}'"
