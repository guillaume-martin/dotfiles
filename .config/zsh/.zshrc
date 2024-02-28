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

# Load local settings
source $XDG_CONFIG_HOME/profiles/profile

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
# source ~/miniconda3/bin/virtualenvwrapper.sh
# export WORKON_HOME=~/.env
# export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python3

# Setup fzf
if type rg &> /dev/null; then
  export FZF_DEFAULT_COMMAND='rg --files'
  export FZF_DEFAULT_OPTS='-m --height 50% --border'
fi

# Plugins
zsh_add_plugin "zsh-users/zsh-autosuggestions"
zsh_add_plugin "zsh-users/zsh-syntax-highlighting"
zsh_add_plugin "hlissner/zsh-autopair"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/guillaume/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/guillaume/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/home/guillaume/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/guillaume/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

