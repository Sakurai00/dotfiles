# ====== Load conf.d ======
for file in ${ZDOTDIR}/conf.d/*.zsh(N); do
  source "$file"
done
# ====== ====== ======


autoload -U colors && colors
eval "$(dircolors -b ~/.zsh/.dircolors)"


setopt correct
SPROMPT="correct: $RED%R$DEFAULT -> $GREEN%r$DEFAULT ? [Yes/No/Abort/Edit] : "


setopt ignore_eof

setopt notify # ジョブ通知
