#!/usr/bin/env zsh

# XDG Paths
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"


# Set path to config files
export DOTFILES="$HOME/.dotfiles"
export ZDOTDIR="$XDG_CONFIG_HOME/zsh"

export HISTFILE="$XDG_CACHE_HOME/.zhistory"    # History filepath
export HISTSIZE=10000                          # Maximum events for internal history
export SAVEHIST=10000                          # Maximum events in history file

# Set default editor
export EDITOR="vim"
export VISUAL="vim"

# virtualenvwrapper setup
export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python3
export WORKON_HOME=/home/guillaume/.virtualenvs
export VIRTUALENVWRAPPER_VIRTUALENV=/home/guillaume/.local/bin/virtualenv

