#!/usr/bin/env zsh

source "$ZDOTDIR/zsh-functions"


# Setup options
setopt autocd extendedglob nomatch menucomplete
setopt interactive_comments
stty stop undef # Disable Ctrl+S to freeze terminar

# Load prompt
source $ZDOTDIR/zsh-prompt

# Load aliases
source $XDG_CONFIG_HOME/aliases/aliases

# Enable completion
source $ZDOTDIR/zsh-completions

# Colors
autoload -Uz colors && colors

# Plugins
zsh_add_plugin "zsh-users/zsh-autosuggestions"
zsh_add_plugin "zsh-users/zsh-syntax-highlighting"
zsh_add_plugin "hlissner/zsh-autopair"
