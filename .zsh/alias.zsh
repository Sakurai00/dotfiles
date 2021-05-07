if type exa > /dev/null 2>&1; then
    alias ls="exa -F"
    alias ll="exa -alF --git"
    alias llt="exa -alFT -I '.git'"
fi
alias cpi="cp -i"
alias mvi="mv -i"
alias rmi="rm -i"
alias his="history"
alias relogin="exec $SHELL -l"
if type nvim > /dev/null 2>&1; then
    alias vim="nvim"
fi
if type batcat > /dev/null 2>&1; then
    alias cat="batcat"
fi