#!/usr/bin/env zsh

source "$ZDOTDIR/zsh-functions"


# Setup options
setopt autocd extendedglob nomatch menucomplete
setopt interactive_comments
stty stop undef # Disable Ctrl+S to freeze terminar

# Load prompt
fpath=($DOTFILES/.config/zsh/prompt $fpath)
source $DOTFILES/.config/zsh/prompt/zsh-prompt

# Load aliases
source $XDG_CONFIG_HOME/aliases/aliases

# Enable completion
source $ZDOTDIR/zsh-completion

# Colors
autoload -Uz colors && colors

# Plugins
# zsh_add_plugin "zsh-users/zsh-autosuggestion"
zsh_add_plugin "zsh-users/zsh-syntax-highlighting"
zsh_add_plugin "hlissner/zsh-autopair"
