#!/usr/bin/env zsh


export PATH="$PATH:$HOME/.local/bin"

source "$ZDOTDIR/zsh-functions"


# Setup options
setopt autocd extendedglob nomatch menucomplete
setopt interactive_comments
stty stop undef # Disable Ctrl+S to freeze terminal

# Load prompt
source $ZDOTDIR/zsh-prompt

# Load aliases
source $XDG_CONFIG_HOME/aliases/aliases

# Enable completion
autoload bashcompinit && bashcompinit
source $ZDOTDIR/zsh-completion
complete -C "/usr/bin/aws_completer" aws

# Colors
autoload -Uz colors && colors

# Set TERM to make highlighting works in tmux
# Source: https://github.com/zsh-users/zsh-autosuggestions/issues/229#issuecomment-300675586
TERM=xterm-256color

# Activate virtualenvwrapper
source ~/.local/bin/virtualenvwrapper.sh

# Setup fzf
if type rg &> /dev/null; then
  export FZF_DEFAULT_COMMAND='rg --files'
  export FZF_DEFAULT_OPTS='-m --height 50% --border'
fi

# Plugins
zsh_add_plugin "zsh-users/zsh-autosuggestions"
zsh_add_plugin "zsh-users/zsh-syntax-highlighting"
zsh_add_plugin "hlissner/zsh-autopair"
