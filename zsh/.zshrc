
export ZSH=/Users/kyle/.oh-my-zsh

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
plugins=(git)

# User configuration

export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"
# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

if which ruby >/dev/null && which gem >/dev/null; then
    PATH="$(ruby -rubygems -e 'puts Gem.user_dir')/bin:$PATH"
fi

lclone() {
    git clone https://git.universe25.com/${1}.git
}

gclone() {
    git clone https://github.com/${1}.git
}

iosadd() {
    ios devices:add "${1}"=${2}
}

iosmanage() {
    ios profiles:manage:devices --type distribution
}

arduino-lib() {
    rm ~/Documents/Arduino/libraries
    ln -s ${PWD} ~/Documents/Arduino/libraries
}

alias o.='open .'

alias ga='git add'
alias gaa='git add -A'
alias gp='git push'
alias gl="git log --all --graph --pretty=format:'%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --date=relative"
alias gs='git status'
alias gd='git diff'
alias gdc='git diff --cached'
alias gm='git commit -m'
alias gma='git commit -am'
alias gb='git branch'
alias gc='git checkout'
alias gra='git remote add'
alias grr='git remote rm'
alias gpu='git pull'
alias gcl='git clone'
alias grc='git reset --hard'
alias gst='git stash'
alias gsd='git stash drop'
alias gcp='git cherry-pick'

alias fl='fastlane'
alias lane='fastlane'

function plex() {
    ssh -L 32400:192.168.11.80:32400 dedi
}

alias fuckxcode="rm -rf $HOME/Library/Developer/Xcode/DerivedData"
alias update_gems="gem update `gem list | cut -d ' ' -f 1`"

set -o vi

export PATH=$PATH:/usr/local/CrossPack-AVR/bin:$HOME/Library/Python/2.7/bin

export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME/Documents/Development
source $HOME/Library/Python/2.7/bin/virtualenvwrapper.sh

export DEVKITPRO=/opt/devkitpro
export DEVKITPPC=$DEVKITPRO/devkitPPC
export DEVKITARM=$DEVKITPRO/devkitARM

export WIILOAD=tcp:192.168.11.116

export PILOT_USERNAME="apple-locorobo@kylelevin.com"
export PILOT_APP_IDENTIFIER="co.locorobo.ios"

# Extract things. Thanks to urukrama, Ubuntuforums.org
extract () {
     if [ -f $1 ] ; then
         case $1 in
             *.tar.bz2)   tar xjf $1;;
             *.tar.gz)    tar xzf $1;;
             *.bz2)       bunzip2 $1;;
             *.rar)       unrar x $1;;
             *.gz)        gunzip $1;;
             *.tar)       tar xf $1;;
             *.tbz2)      tar xjf $1;;
             *.tgz)       tar xzf $1;;
             *.zip)       unzip $1;;
             *.Z)         uncompress $1;;
             *.7z)        7z x $1;;
             *)           echo "'$1' cannot be extracted via extract()" ;;
         esac
     else
         echo "'$1' is not a valid file"
     fi
}

function powerline_precmd() {
PS1="$(~/.powerline-shell.py $? --shell zsh 2> /dev/null)"
}

function install_powerline_precmd() {
for s in "${precmd_functions[@]}"; do
if [ "$s" = "powerline_precmd" ]; then
  return
fi
done
precmd_functions+=(powerline_precmd)
}

if [ "$TERM" != "linux" ]; then
install_powerline_precmd
fi

. `brew --prefix`/etc/profile.d/z.sh

ARDUINO_DIR=/Applications/Arduino.app/Contents/Java
AVR_TOOLS_DIR=/usr/local/CrossPack-AVR/bin
