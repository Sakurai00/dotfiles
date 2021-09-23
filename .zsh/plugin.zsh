# ====== Zinit installer ======
if [[ ! -f $HOME/.zinit/bin/zinit.zsh ]]; then
    print -P "%F{33}▓▒░ %F{220}Installing %F{33}DHARMA%F{220} Initiative Plugin Manager (%F{33}zdharma/zinit%F{220})…%f"
    command mkdir -p "$HOME/.zinit" && command chmod g-rwX "$HOME/.zinit"
    command git clone https://github.com/zdharma/zinit "$HOME/.zinit/bin" && \
        print -P "%F{33}▓▒░ %F{34}Installation successful.%f%b" || \
        print -P "%F{160}▓▒░ The clone has failed.%f%b"
fi
# ====== ====== ======


# ====== Load Zinit ======
source "$HOME/.zinit/bin/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit
# ====== ====== ======


# ====== Load Powerlevel10k ======
zinit ice depth=1; zinit light romkatv/powerlevel10k
[[ ! -f ~/.zsh/p10k.zsh ]] || source ~/.zsh/p10k.zsh
# ====== ====== ======


# ====== Load Zinit plugins ======
# https://zdharma.github.io/zinit/wiki/Example-Minimal-Setup/
zinit wait lucid light-mode for \
  atinit"zicompinit; zicdreplay" \
    zdharma/fast-syntax-highlighting \
  atload"_zsh_autosuggest_start" \
    zsh-users/zsh-autosuggestions \
  blockf atpull'zinit creinstall -q .' \
    zsh-users/zsh-completions \

zinit wait'1' lucid light-mode for \
  zdharma/history-search-multi-word
# ====== ====== ======

# ====== Load anyenv======
eval "$(anyenv init -)"
# ====== ====== ======
