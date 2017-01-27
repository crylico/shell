# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="dieter"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git, osx, vi-mode, web-search, common-aliases)

source $ZSH/oh-my-zsh.sh

MISC=~/.misc/

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

if [ -f `brew --prefix`/etc/profile.d/z.sh ]; then
    . `brew --prefix`/etc/profile.d/z.sh
fi

#if [[ -f `which rbenv` ]]; then
#    eval "$(rbenv init -)"
#fi

if [[ -f `which pyenv` ]]; then
#    eval "$(pyenv init -)"
#    eval "$(pyenv-virtualenv init -)"
fi

#if [[ -f `which swiftenv` ]]; then
#    eval "$(swiftenv init -)"
#fi

#if [[ -f `which xcenv` ]]; then
#    eval "$(xcenv init -)"
#fi


#export NVM_DIR="/Users/kyle/.nvm"
#[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

set -o vi

PATH=$PATH:/usr/local/CrossPack-AVR/bin

export DEVKITPRO=/opt/devkitpro
export DEVKITARM=/opt/devkitpro/devkitARM
export PATH=$PATH:/opt/devkitpro/devkitARM/bin
