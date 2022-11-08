#!/usr/bin/env zsh


# +--------+
# | PROMPT |
# +--------+

fpath=($DOTFILES/.config/zsh/prompt $fpath)
source $DOTFILES/.config/zsh/prompt/prompt_setup


# +---------+
# | ALIASES |
# +---------+
source $XDG_CONFIG_HOME/aliases/aliases


# +------------+
# | COMPLETION |
# +------------+
source $DOTFILES/.config/zsh/completion.zsh
