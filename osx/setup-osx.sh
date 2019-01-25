#!/bin/sh

set -e

echo "###################$(tput setaf 2) hostname $(tput setaf 7)###################"

read -n1 -p "set hostname? [y,n] " c
echo

function set_hostname() {

	read -p "enter hostname: " h

	sudo scutil --set ComputerName "$h"
	sudo scutil --set LocalHostName "$h"
	sudo scutil --set HostName "$h"
}

case $c in
	y|Y) set_hostname ;;
	*) echo "skipping hostname" ;;
esac

echo "###################$(tput setaf 1) hostname $(tput setaf 7)###################"
echo
echo
echo "###################$(tput setaf 2) homebrew $(tput setaf 7)###################"

read -n1 -p "install brew? [y,n] " c
echo

case $c in
	y|Y) /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)" && brew update ;;
	*) echo "skipping brew install" ;;
esac

echo

read -n1 -p "install utils from brew? [y,n] " c
echo

case $c in
	y|Y) brew install wget cmake gcc gdb git tmux stow macvim pyenv z ffmpeg reattach-to-user-namespace ;;
	*) echo "skipping utils from brew" ;;
esac

echo


read -n1 -p "install apps from brew? [y,n] " c
echo

case $c in
	y|Y) brew cask install google-chrome discord osbuddy 1password dropbox ;;
	*) echo "skipping apps from brew" ;;
esac

echo "###################$(tput setaf 1) homebrew $(tput setaf 7)###################"
echo
echo
echo "####################$(tput setaf 2) ssh key $(tput setaf 7)###################"

function create_ssh_key() {
	mkdir -m700 ~/.ssh
	ssh-keygen
	cat ~/.ssh/id_rsa.pub | pbcopy

	echo
	echo "public ssh key copied to clipboard"
	echo
}

read -n1 -p "create ssh key? [y,n] " c
echo

case $c in
	y|Y) create_ssh_key ;;
	*) echo "skipping ssh key creation" ;;
esac

echo "####################$(tput setaf 1) ssh key $(tput setaf 7)###################"
echo
echo
echo "#################$(tput setaf 2) shell config $(tput setaf 7)#################"

function clone_config() {
	git config --global user.name "Kyle Levin"
	git config --global user.email me@kylelevin.com

	git clone git@github.com:crylico/shell.git ~/.shell
	git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

    git clone git@github.com:tomasr/molokai.git /tmp/molokai && mv /tmp/molokai/colors ~/.vim

	sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"

	rm -rf ~/.zshrc

	cd ~/.shell
	stow shell && stow zsh && stow ssh && stow vim
}

read -n1 -p "setup zsh and shell config? [y,n] " c
echo

case $c in
	y|Y) clone_config ;;
	*) echo "skipping zsh and shell config" ;;
esac

echo "#################$(tput setaf 1) shell config $(tput setaf 7)#################"
echo
echo
echo "#################$(tput setaf 2) pyenv setup $(tput setaf 7)##################"

echo
read -n1 -p "install a few python versions? [y,n] " c
echo

function install_python() {
    pyenv install 2.7.14
    pyenv install 3.6.6
}

case $c in
	y|Y) install_python ;;
	*) echo "skipping python install" ;;
esac

echo "#################$(tput setaf 1) pyenv setup $(tput setaf 7)##################"
echo
echo
echo "#################$(tput setaf 2) rbenv setup $(tput setaf 7)##################"

echo
read -n1 -p "install a few ruby versions? [y,n] " c
echo

function install_ruby() {
    rbenv install 2.6.0-preview2
    rbenv install 2.5.1
}

case $c in
	y|Y) install_ruby ;;
	*) echo "skipping ruby install" ;;
esac

echo "#################$(tput setaf 1) rbenv setup $(tput setaf 7)##################"
