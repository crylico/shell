export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="dieter"

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

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
