# Auto-completion
# ---------------
[[ $- == *i* ]] && source "$HOME/.fzf/shell/completion.zsh" 2> /dev/null


# Key bindings
# ------------
source "$HOME/.fzf/shell/key-bindings.zsh"
source <(fzf --zsh)


# Default Command
if type rg > /dev/null 2>&1; then
    export FZF_DEFAULT_COMMAND='rg --files --hidden --follow --glob "!.git"'
else
    export FZF_DEFAULT_COMMAND='find * -type f'
fi

export FZF_DEFAULT_OPTS='
    --height 80%
    --layout=reverse
    --border=rounded
    --multi
    --info=inline'


# Ctrl + R
export FZF_CTRL_R_OPTS="
    --preview 'echo {}'
    --preview-window up:3:hidden:wrap
    --bind 'ctrl-/:toggle-preview'"


# Ctrl + T
if type bat > /dev/null 2>&1; then
    export FZF_CTRL_T_OPTS="
        --preview 'bat -n --color=always {}'
        --preview-window=right,70%,wrap
        --bind 'ctrl-/:toggle-preview'"
else
    export FZF_CTRL_T_OPTS="
        --preview 'cat -n {}'
        --preview-window=right,70%,wrap
        --bind 'ctrl-/:toggle-preview'"
fi


# Alt + C
export FZF_ALT_C_OPTS="--preview 'tree -C {}'"


# Function
fd() {
  local dir
  dir=$(find ${1:-.} -path '*/\.*' -prune \
                  -o -type d -print 2> /dev/null | fzf +m) &&
  cd "$dir"
}

fda() {
  local dir
  dir=$(find ${1:-.} -type d 2> /dev/null | fzf +m) && cd "$dir"
}

tm() {
  [[ -n "$TMUX" ]] && change="switch-client" || change="attach-session"
  if [ $1 ]; then
    tmux $change -t "$1" 2>/dev/null || (tmux new-session -d -s $1 && tmux $change -t "$1"); return
  fi
  session=$(tmux list-sessions -F "#{session_name}" 2>/dev/null | fzf --exit-0) &&  tmux $change -t "$session" || echo "No sessions found."
}

#unalias z
z() {
  if [[ -z "$*" ]]; then
    cd "$(_z -l 2>&1 | fzf +s --tac | sed 's/^[0-9,.]* *//')"
  else
    _last_z_args="$@"
    _z "$@"
  fi
}
