# fzf installation root search
# ---------------------------
_fzf_candidates=(
    "$HOME/.fzf"            # Linux (git installation)
    "/opt/homebrew/opt/fzf" # macOS (Homebrew Apple Silicon)
    "/usr/local/opt/fzf"    # macOS (Homebrew Intel)
)

_fzf_root=""
for _dir in $_fzf_candidates; do
    if [[ -d "$_dir" ]]; then
        _fzf_root="$_dir"
        break
    fi
done

# Environment Setup
# -----------------
if [[ -n "$_fzf_root" ]]; then
    # Add to PATH if it's a manual git install
    [[ "$_fzf_root" == "$HOME/.fzf" ]] && path=("$_fzf_root/bin" $path)

    # Auto-completion
    [[ $- == *i* ]] && source "$_fzf_root/shell/completion.zsh" 2> /dev/null

    # Key bindings
    source "$_fzf_root/shell/key-bindings.zsh"
fi

# Modern Initialization (fzf >= 0.48.0)
if type fzf > /dev/null 2>&1; then
    source <(fzf --zsh)
fi

unset _fzf_candidates _fzf_root

export FZF_COMPLETION_TRIGGER=','


# Default Command
# ------------
if type rg > /dev/null 2>&1; then
    export FZF_DEFAULT_COMMAND='
        rg --files --hidden --follow --glob "!{.git}/**"
'
else
    export FZF_DEFAULT_COMMAND='
        find * -type f
'
fi

export FZF_DEFAULT_OPTS="
    --height 80%                    # 絞り込みウィンドウの高さをウィンドウの80%に制限する
    --layout=reverse                # 絞り込み結果を上から表示
    --border=rounded                # fzfのウィンドウを囲う
    --info=inline                   # 検索結果数をプロンプトバーに表示する
    --pointer='▶'
    --marker='✓'
    --multi                         # TABで複数選択可能に
    --bind 'change:top'             # 検索ワードを入れたときに、一番上の選択項目を再選択する
    --bind 'ctrl-/:toggle-preview'  # Ctrl+/でプレビュー表示切り替え
"


# Ctrl + R
# ------------
export FZF_CTRL_R_OPTS="
    --preview 'echo {}'
    --preview-window up:3:hidden:wrap
"


# Ctrl + T
# ------------
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

if type bat > /dev/null 2>&1; then
    export FZF_CTRL_T_OPTS="
        --preview 'bat --style=numbers --color=always {}'
        --preview-window=right,70%,wrap
"
else
    export FZF_CTRL_T_OPTS="
        --preview 'cat -n {}'
        --preview-window=right,70%,wrap
"
fi


# Alt + C
# ------------
if type eza > /dev/null 2>&1; then
    export FZF_ALT_C_OPTS="
        --preview 'eza --tree --color=always {} | head -200'
"
else
    export FZF_ALT_C_OPTS="
        --preview 'tree -C {} | head -200'
"
fi


export FZF_TMUX=1
export FZF_TMUX_OPTS="-p 80%"


# https://wonderwall.hatenablog.com/entry/2017/10/06/063000
# https://github.com/junegunn/fzf/wiki/Configuring-shell-key-bindings
# https://github.com/junegunn/fzf/wiki/Examples
