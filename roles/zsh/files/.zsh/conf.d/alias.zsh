# --- Core Shell ---
alias sudo='sudo '
alias cpi='cp -i'
alias mvi='mv -i'
alias rmi='rm -i'
alias his='history'
alias relogin='exec $SHELL -l'

# --- Package Manager ---
if (( $+commands[apt-fast] )); then
    alias apt='apt-fast'
fi

# --- Modern CLI Tools ---
if (( $+commands[eza] )); then
    alias ls='eza -F'
    alias lt='eza -aT -I ".git|.github"'
    alias ll='eza -alF --git'
    alias llt='eza -alFT -I ".git"'
fi

if (( $+commands[bat] )); then
    alias cat='bat'
fi

# --- Development Tools ---
(( $+commands[nvim] ))    && alias vim='nvim'
(( $+commands[git] ))     && alias g='git'
(( $+commands[kubectl] )) && alias k='kubectl'

# --- Custom Shortcuts ---
alias tm3='tmux new-session \; split-window -h \; split-window -v \;'
alias getpath='echo $PATH | sed -e "s/:/\n/g"'
