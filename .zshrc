export EDITOR='helix'
export SHELL=/bin/bash
# export PATH="$PATH:/usr/bin/python.311"

export HISTFILE=~/.zsh_history
export HISTSIZE=100000
export SAVEHIST=100000
export HISTDUP=erase

export VISUAL='kitty helix'
# export PAGER='less -R'
export MANPAGER="sh -c 'sed -e s/.\\\\x08//g | bat -p -l man'"
export PAGER='bat --color=always'
export DIFFPROG="nvim -d"
export DOTBARE_DIR="$HOME/.dotfiles"
export DOTBARE_TREE="$HOME"
export DOTBARE_PREVIEW="bat -n {}"
export DOTBARE_BACKUP="/home/hdd/dots-backup"
# PATH=$PATH$( find $HOME/bin/ -type d -printf ":%p" )
# PATH=$PATH$( fd . $HOME/bin/ -t d -d 1 -X printf " %s" {} )
# path+=$( fd . $HOME/bin/ -t d -d 1 -X printf " %s" {} )
# PATH=$PATH$( find $HOME/scripts/ -type d -printf ":%p" ):$PATH
# export PATH=$HOME/.config/rofi/scripts:$PATH

# export BAT_THEME="Catppuccin-mocha"
# LESS_TERMCAP_md=$'\E[01;31m' LESS_TERMCAP_me=$'\E[0m' GROFF_NO_SGR=1
# LESS_TERMCAP_se=$'\E[0m' LESS_TERMCAP_so=$'\E[01;32m'
# LESS_TERMCAP_us=$'\E[04;33m' LESS_TERMCAP_ue=$'\E[0m'

# --- Pywal ---
# shellcheck source=/dev/null
# source "$HOME/.cache/wal/colors.sh"

# --- Fzf-nvim-switcher --- 
# uses neovim nightly 9+
alias nvim-lazy="NVIM_APPNAME=LazyVim nvim"
alias nvim-kick="NVIM_APPNAME=MyNvim nvim"
# alias nvim-chad="NVIM_APPNAME=nvim-ditsuke nvim"
# alias nvim-astro="NVIM_APPNAME=AstroNvim nvim"

function nvims() {
  items=("default" "MyNvim" "LazyVim" "nvim-ide" "AstroNvim")
  config=$(printf "%s\n" "${items[@]}" | fzf --prompt=" Neovim Config  " --height=~50% --layout=reverse --border --exit-0)
  if [[ -z $config ]]; then
    echo "Nothing selected"
    return 0
  elif [[ $config == "default" ]]; then
    config=""
  fi
  NVIM_APPNAME=$config nvim "$@"
}

bindkey -s ^a "nvims\n"

# --- fzf tab ---
# shellcheck source=/dev/null
source "$HOME/github/fzf-tab/fzf-tab.plugin.zsh"

# shellcheck source=/dev/null
source "$HOME/.config/zsh/fzf-history/zsh-fzf-history-search.zsh"
zstyle ':autocomplete:*' default-context history-incremental-search-backward

# fzf history
# source ~/github/zsh-autocomp/zsh-autocomplete.plugin.zsh

# Starship
export STARSHIP_CONFIG=~/.config/starship.toml
eval "$(starship init zsh)"

# --- Keys ---
bindkey '^[[1;5C' forward-word                    # ctrl + ->
bindkey '^[[1;5D' backward-word                   # ctrl + <-
bindkey ' ' magic-space

# enable completion features
autoload -Uz compinit
compinit -d ~/.cache/zcompdump
setopt COMPLETE_IN_WORD     # Complete from both ends of a word.
setopt AUTO_LIST            # Automatically list choices on ambiguous completion.
setopt magicequalsubst     # enable filename expansion for arguments of the form ‘anything=expression’
setopt nonomatch           # hide error message if there is no match for the pattern
setopt notify              # report the status of background jobs immediately
setopt numericglobsort     # sort filenames numerically when it makes sense
setopt promptsubst         # enable command substitution in prompt

zstyle ':completion:*' fzf-search-display true

# --- fzf-tab-opts ---
# disable sort when completing `git checkout`
zstyle ':completion:*:git-checkout:*' sort false
# set descriptions format to enable group support
zstyle ':completion:*:descriptions' format '[%d]'
# set list-colors to enable filename colorizing
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
# preview directory's content with exa when completing cd
zstyle ':fzf-tab:complete:cd:*' fzf-preview "exa -1 --color=always $realpath"
# switch group using `,` and `.`
zstyle ':fzf-tab:*' switch-group ',' '.'

## tab sources
source ~/.config/zsh/plugins/fzf-tab-source/*.zsh

# History configurations
setopt autocd
setopt hist_ignore_space      # ignore commands that start with space
setopt share_history         # share command history data
setopt sharehistory
setopt interactivecomments # allow comments in interactive mode
setopt numericglobsort     # sort filenames numerically when it makes sense

setopt HIST_EXPIRE_DUPS_FIRST    # Expire duplicate entries first when trimming history.
setopt HIST_IGNORE_DUPS          # Don't record an entry that was just recorded again.
setopt HIST_IGNORE_ALL_DUPS      # Delete old recorded entry if new entry is a duplicate.

# THIS IS IT LOL THIS WAS WHAT I WAS LOOKING FOR HAHAHA
# match the command in history and search ie: wget ... + up key searches for wget cmds
autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey "^[[A" up-line-or-beginning-search # Up
bindkey "^[[B" down-line-or-beginning-search # Down

bindkey ' ' magic-space                           # do history expansion on space
bindkey '^U' backward-kill-line                   # ctrl + U
bindkey '^[[3;5~' kill-word                       # ctrl + Supr
bindkey '^[[3~' delete-char                       # delete
bindkey '^[[1;5C' forward-word                    # ctrl + ->
bindkey '^[[1;5D' backward-word                   # ctrl + <-
bindkey '^[[5~' beginning-of-buffer-or-history    # page up
bindkey '^[[6~' end-of-buffer-or-history          # page down
bindkey '^[[H' beginning-of-line                  # home
bindkey '^[[F' end-of-line                        # end
bindkey '^[[Z' undo                               # shift + tab undo last action

# configure `time` format
TIMEFMT=$'\nreal\t%E\nuser\t%U\nsys\t%S\ncpu\t%P'

# --- ani-cli ---
# export ANI_CLI_EXTERNAL_MENU=0

#-----------[NNN]---------------------#
# export NNN_OPTS="H" # 'H' shows the hidden files. Same as option -H (so 'nnn -deH')
# export LC_COLLATE="C" # hidden files on top
# export NNN_FIFO=/tmp/nnn.fifo # temporary buffer for the previews
# export NNN_PLUG='o:fzopen;e:-!sudo -E nvim $nnn*;c:cdpath;u:getplugs;i:imgview;h:-!hx $nnn*;p:preview-tui;x:!chmod +x $nnn;m:!mpv $nnn'
# export SPLIT='v' # to split Kitty vertically

# NNN_TMPFILE='/tmp/.lastd'
# BLK="04" CHR="04" DIR="04" EXE="00" REG="00" HARDLINK="00" SYMLINK="06" MISSING="00" ORPHAN="01" FIFO="0F" SOCK="0F" OTHER="02"
# export NNN_FCOLORS="$BLK$CHR$DIR$EXE$REG$HARDLINK$SYMLINK$MISSING$ORPHAN$FIFO$SOCK$OTHER"

# if [ -f /usr/share/nnn/quitcd/quitcd.bash_zsh ]; then
#     source /usr/share/nnn/quitcd/quitcd.bash_zsh
# fi

# --- Sources ---
# source aliases and personal scripts
# shellcheck source=/dev/null
source "$HOME/.config/zsh/alias.zsh"
# shellcheck source=/dev/null
source "$HOME/.config/zsh/functions.zsh"
# shellcheck source=/dev/null
source "$HOME/.config/zsh/fzf.zsh"
# shellcheck source=/dev/null
source "$HOME/.config/zsh/xport.zsh"
# shellcheck source=/dev/null
# source ~/.config/zsh/colored-man.zsh
# shellcheck source=/dev/null
source "$HOME/.config/zsh/zplugs/dirhistory/dirhistory.plugin.zsh"

# source auto suggestions and syntax highlighting (syntax needs to be last)
# shellcheck source=/dev/null
source "$HOME/.config/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh"
# ZSH_AUTOSUGGEST_STRATEGY=(history)
# Remove forward-char widgets from ACCEPT
# ZSH_AUTOSUGGEST_ACCEPT_WIDGETS=("${(@)ZSH_AUTOSUGGEST_ACCEPT_WIDGETS:#forward-char}")
# Add forward-char widgets to PARTIAL_ACCEPT
# ZSH_AUTOSUGGEST_PARTIAL_ACCEPT_WIDGETS+=(forward-char)

# shellcheck source=/dev/null
source "$HOME/.config/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"

#=#############################################
export PATH="$HOME/.local/bin:$PATH"
# source /home/sweet/.config/broot/launcher/bash/br

# export NVM_DIR="$HOME/.nvm"
# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
# [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
# export PYENV_ROOT="$HOME/.pyenv"
# command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
# eval "$(pyenv init -)"
