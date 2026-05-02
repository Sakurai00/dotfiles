fd() {
  local dir
  dir=$(find ${1:-.} -path '*/\.*' -prune -o -type d -print 2> /dev/null | fzf +m) && cd "$dir"
}

fda() {
  local dir
  dir=$(find ${1:-.} -type d 2> /dev/null | fzf +m) && cd "$dir"
}

if (( $+commands[tmux] )); then
  tm() {
    [[ -n "$TMUX" ]] && change="switch-client" || change="attach-session"
    if [ $1 ]; then
      tmux $change -t "$1" 2>/dev/null || (tmux new-session -d -s $1 && tmux $change -t "$1"); return
    fi
    session=$(tmux list-sessions -F "#{session_name}" 2>/dev/null | fzf --exit-0) &&  tmux $change -t "$session" || echo "No sessions found."
  }
fi

#unalias z
if (( $+commands[_z] || $+functions[_z] )); then
  z() {
    if [[ -z "$*" ]]; then
      cd "$(_z -l 2>&1 | fzf +s --tac | sed 's/^[0-9,.]* *//')"
    else
      _last_z_args="$@"
      _z "$@"
    fi
  }
fi

fkill() {
  local pid
  pid=$(ps -ef | sed 1d | fzf -m | awk '{print $2}')

  if [ "x$pid" != "x" ]; then
    echo $pid | xargs kill -${1:-9}
  fi
}

if (( $+commands[git] && $+commands[fzf-tmux] )); then
  fbr() {
    local branches branch
    branches=$(git for-each-ref --count=30 --sort=-committerdate refs/heads/ --format="%(refname:short)") &&
    branch=$(echo "$branches" |
             fzf-tmux -d $(( 2 + $(wc -l <<< "$branches") )) +m) &&
    git checkout $(echo "$branch" | sed "s/.* //" | sed "s#remotes/[^/]*/##")
  }
fi

if (( $+commands[sshls] )); then
  fs() {
    local host=$(sshls | fzf)
    if [ -n "${host}" ]; then
      echo "Connecting to ${host}..."
      ssh ${host}
    fi
  }
fi

if (( $+commands[ghq] )); then
  fghq() {
    local dir
    dir=$(ghq list --full-path | fzf) && cd "$dir"
  }
fi
