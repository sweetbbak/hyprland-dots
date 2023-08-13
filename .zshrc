export EDITOR='helix'
export SHELL=/bin/bash

export HISTFILE=~/.zsh_history
export HISTSIZE=100000
export SAVEHIST=100000
export HISTDUP=erase

export VISUAL='kitty helix'
# export MANPAGER="sh -c 'sed -e s/.\\\\x08//g | bat --color=always -p -l man'"
export MANPAGER="bat -p -l help"
# export PAGER='bat --color=always'
# export MANPAGER='bat --color=always --plain'
export DIFFPROG="nvim -d"
export DOTBARE_DIR="$HOME/.dotfiles"
export DOTBARE_TREE="$HOME"
export DOTBARE_PREVIEW="bat -n {}"
export DOTBARE_BACKUP="/home/sweet/hdd/dots-backup"

alias tts1="piper-tts --model ~/ssd/model_1/model.onnx --output_raw | aplay -r 22050 -c 1 -f S16_LE -t raw"
alias tts="piper-tts --model ~/ssd/amy/amy.onnx --output_raw | aplay -r 22050 -c 1 -f S16_LE -t raw"

# --- Pywal ---
# shellcheck source=/dev/null
test -f "$HOME/.cache/okolors/colors.sh" && source "$HOME/.cache/okolors/colors.sh"
# source "$HOME/.cache/wal/colors.sh"

# --- fzf tab ---
# shellcheck source=/dev/null
# source "$HOME/github/fzf-tab/fzf-tab.plugin.zsh"
source "$HOME/.config/zsh/plugins/fzf-tab/fzf-tab.plugin.zsh"

# shellcheck source=/dev/null
source "$HOME/.config/zsh/plugins/fzf-history/zsh-fzf-history-search.zsh"
zstyle ':autocomplete:*' default-context history-incremental-search-backward

# shellcheck source=/dev/null
source ~/.config/zsh/plugins/fzf-tab-source/*.zsh

# Starship
export STARSHIP_CONFIG=~/.config/starship/starship.toml
if command -v starship >/dev/null; then
  eval "$(starship init zsh)"
else
  echo -e "\e[33;3mStarship is not installed\e[0m"
fi

# --- Keys ---
bindkey '^[[1;5C' forward-word     # ctrl + ->
bindkey '^[[1;5D' backward-word    # ctrl + <-
bindkey '^H' backward-kill-word    # ctrl+backspace delete word
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
# zstyle ':fzf-tab:complete:cd:*' fzf-preview "exa -1 --color=always $realpath"
# zstyle ':fzf-tab:complete:ls:*' fzf-preview "cat -p {}"
# switch group using `,` and `.`
zstyle ':fzf-tab:*' switch-group ',' '.'


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

# Zoxide
if command -v zoxide >/dev/null; then
  eval "$(zoxide init zsh)"
fi

# --- Sources ---
# source aliases and personal scripts
# shellcheck source=/dev/null
source "$HOME/.config/zsh/alias.zsh"
# shellcheck source=/dev/null
source "$HOME/.config/zsh/functions.zsh"
# shellcheck source=/dev/null
source "$HOME/.config/zsh/fzf.zsh"
# shellcheck source=/dev/null
# source ~/.config/zsh/plugins/colored-man.zsh
# shellcheck source=/dev/null
source "$HOME/.config/zsh/zplugs/dirhistory/dirhistory.plugin.zsh"

# source auto suggestions
# shellcheck source=/dev/null
source "$HOME/.config/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh"

# ZSH_AUTOSUGGEST_STRATEGY=(history)
# Remove forward-char widgets from ACCEPT
# ZSH_AUTOSUGGEST_ACCEPT_WIDGETS=("${(@)ZSH_AUTOSUGGEST_ACCEPT_WIDGETS:#forward-char}")
# Add forward-char widgets to PARTIAL_ACCEPT
# ZSH_AUTOSUGGEST_PARTIAL_ACCEPT_WIDGETS+=(forward-char)

# shellcheck source=/dev/null
# must be loaded last
source "$HOME/.config/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
