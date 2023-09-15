# link to $ZDOTDIR/plugin/fzf.zsh


if [ -d "$HOME/.fzf" ] ; then
    export PATH="$HOME/.fzf/bin:$PATH"
fi


# Auto-completion
# ---------------
[[ $- == *i* ]] && source "$HOME/.fzf/shell/completion.zsh" 2> /dev/null


# Key bindings
# ------------
source "$HOME/.fzf/shell/key-bindings.zsh"


export FZF_DEFAULT_COMMAND='rg --files --hidden --follow --glob "!.git"'
export FZF_DEFAULT_OPTS='--height 40% --reverse --border'
