# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="dieter"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git, osx, vi-mode, web-search)

source $ZSH/oh-my-zsh.sh

MISC=~/.misc/

# Load External BASH
if [ -f $MISC/.credentials ]; then
    source $MISC/.credentials
fi

# Load External BASH
if [ -f $MISC/.aliases ]; then
    source $MISC/.aliases
fi

# Load External BASH
if [ -f $MISC/.functions ]; then
    source $MISC/.functions
fi

# Load External BASH
if [ -f $MISC/.exports ]; then
    source $MISC/.exports
fi

# Load External Working BASH
if [ -f $MISC/.working ]; then
    source $MISC/.working
fi

if [[ -f `which brew` ]]; then 
    if [ -f `brew --prefix`/etc/profile.d/z.sh ]; then
        . `brew --prefix`/etc/profile.d/z.sh
    fi
fi

set -o vi
