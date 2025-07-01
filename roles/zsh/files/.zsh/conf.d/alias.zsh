alias sudo='sudo '

if type apt-fast > /dev/null 2>&1; then
    alias apt="apt-fast"
fi

if type eza > /dev/null 2>&1; then
    alias ls="eza -F"
    alias lt="eza -aT -I '.git|.github'"
    alias ll="eza -alF --git"
    alias llt="eza -alFT -I '.git'"
fi

alias cpi="cp -i"
alias mvi="mv -i"
alias rmi="rm -i"
alias his="history"
alias relogin="exec $SHELL -l"
alias getpath="echo $PATH | sed -e 's/:/\n/g'"
alias tm3="tmux new-session \; split-window -h \; split-window -v \;"

if type nvim > /dev/null 2>&1; then
    alias vim="nvim"
fi

if type bat > /dev/null 2>&1; then
    alias cat="bat"
fi

if type git > /dev/null 2>&1; then
    alias g="git"
fi
