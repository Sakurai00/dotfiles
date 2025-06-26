# ====== Zinit installer ======
if [[ ! -f $HOME/.zinit/bin/zinit.zsh ]]; then
    print -P "%F{33}▓▒░ %F{220}Installing %F{33}DHARMA%F{220} Initiative Plugin Manager (%F{33}zdharma/zinit%F{220})…%f"
    command mkdir -p "$HOME/.zinit" && command chmod g-rwX "$HOME/.zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.zinit/bin" && \
        print -P "%F{33}▓▒░ %F{34}Installation successful.%f%b" || \
        print -P "%F{160}▓▒░ The clone has failed.%f%b"
fi
# ====== ====== ======


# ====== Load Zinit ======
source "$HOME/.zinit/bin/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit
# ====== ====== ======


# ====== Completion ======
zinit ice blockf atpull'zinit creinstall -q .'
zinit light zsh-users/zsh-completions

zinit wait'1' lucid as"completion" is-snippet for \
  https://github.com/docker/cli/blob/master/contrib/completion/zsh/_docker \
  https://raw.githubusercontent.com/docker/compose/1.29.2/contrib/completion/zsh/_docker-compose \
  https://github.com/ilikenwf/apt-fast/blob/master/completions/zsh/_apt-fast \
  https://github.com/alacritty/alacritty/blob/master/extra/completions/_alacritty \
  https://github.com/jdx/mise/blob/main/completions/_mise \

autoload -Uz compinit && compinit -C
# ====== ====== ======


# ====== Load Zinit plugins ======
zinit ice depth=1
zinit light romkatv/powerlevel10k

zinit ice wait lucid atload'_zsh_autosuggest_start'
zinit light zsh-users/zsh-autosuggestions

zinit ice wait lucid
zinit light zdharma-continuum/fast-syntax-highlighting
# ====== ====== ======
