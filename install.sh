#!/bin/bash

# Check for Homebrew install,
# install if not found
if test ! $(which brew); then
	echo "Installing homebrew..."
	ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Install dotfile dependencies and other userful things
brew update
brew tap iveney/mocha # has realpath
brew install coreutils
brew install findutils
brew install realpath


function doIt() {
	for SOURCE in .oh-my-zsh .zshrc .vimrc .vim .tmux.conf
	do
		ln -hfis "$(realpath $SOURCE)" ~
	done
	unset SOURCE
}

doIt

# Change shell to zsh
chsh -s /bin/zsh

unset doIt
