cat ~/.cache/wallust/sequences

fpath=($ZDOTDIR/themes $fpath)
[[ -z $IS_TUI ]] && autoload -Uz prompt_Enderification; prompt_Enderification

local CACHE_DIR="$HOME/.cache/zsh"
mkdir -p $CACHE_DIR

alias ff="fastfetch"
alias macchina="macchina -o host,kernel,window-manager,shell,terminal,uptime"

alias dots="nvim ~/Endrland-Dots"
alias hyprconf="nvim ~/.config/hypr"
alias vimconf="nvim ~/.config/nvim"

alias venv="source .venv/bin/activate"

alias gcm="git commit -m"
alias gaa="git add --all"

alias d='dirs -v'
for index ({1..9}) alias "$index"="cd +${index}"; unset index

# options
setopt AUTOCD
setopt PROMPT_SUBST
setopt AUTO_PUSHD
setopt PUSHD_IGNORE_DUPS
setopt PUSHD_SILENT
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_REDUCE_BLANKS
export VIRTUAL_ENV_DISABLE_PROMPT=1

# go
export PATH=$PATH:$GOBIN


if [[ -z $IS_TUI ]]; then
macchina

# zsh completion
autoload -Uz compinit; compinit
_comp_options+=(globdots)

# Menu completion
setopt MENU_COMPLETE

zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path "$CACHE_DIR/compcache"
zstyle ':completion:*' menu select

# version control setup
autoload -Uz vcs_info
zstyle ':vcs_info:*' enable git
precmd() {
    vcs_info
}

# plugins
fpath=($ZDOTDIR/plugins/zsh-completions/src $fpath)
source $ZDOTDIR/plugins/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh
source $ZDOTDIR/plugins/zsh-autosuggestions/zsh-autosuggestions.plugin.zsh

source <(fzf --zsh)

# uv
eval "$(uv generate-shell-completion zsh)"
eval "$(uvx --generate-shell-completion zsh)"

fi



