# Path to your oh-my-zsh installation.
export ZSH=/Users/mhanne/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="ys"

COMPLETION_WAITING_DOTS="true"
CASE_SENSITIVE="false"
HYPHEN_INSENSITIVE="true"
# ENABLE_CORRECTION="true"

plugins=(git z)

# User configuration

export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"
# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh
export EDITOR='vim'

# You may need to manually set your language environment
# export LANG=en_US.UTF-8
