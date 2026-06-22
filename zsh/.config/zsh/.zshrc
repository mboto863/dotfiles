source $HOME/.config/zsh/aliases.zsh
source $HOME/.config/zsh/syntax.zsh
source $HOME/.config/zsh/functions.zsh
# =========================================================
# History
# =========================================================

HISTFILE="$XDG_STATE_HOME/zsh/history"
HISTSIZE=100000
SAVEHIST=100000

setopt APPEND_HISTORY
setopt SHARE_HISTORY
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_FIND_NO_DUPS

# =========================================================
# Shell behaviour
# =========================================================

setopt AUTOCD
setopt NOBEEP
setopt NUMERIC_GLOB_SORT # sort file10 after file9, not after file1

# =========================================================
# Completion
# =========================================================

# Load completion system
autoload -Uz compinit

# Initialize completion with cached metadata file
compinit -d "$XDG_CACHE_HOME/zsh/zcompdump"

# Enable interactive completion menu selection
zstyle ':completion:*' menu select

# Make completion case-insensitive
# Example: "doc" can complete to "Documents"
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'

# Set editing mode for interactive use.
bindkey -v

# Run on directory change
autoload -U add-zsh-hook
add-zsh-hook chpwd _activate_env

# Run on inital shell launch
_activate_env

# Autoload runpy function.
autoload -Uz runpy pytrack

# Added by uv.
. "$HOME/.local/share/../bin/env"

source "$HOME/.config/broot/launcher/bash/br"

# Load the Version Control System into the prompt.
autoload -Uz vcs_info
precmd() { vcs_info }

# VCS is git.
zstyle ':vcs_info:git:*' formats '%b'

# Substitute the prompt.
setopt PROMPT_SUBST
PROMPT='%F{blue}%~%f %F{red}${vcs_info_msg_0_}%f$ '
