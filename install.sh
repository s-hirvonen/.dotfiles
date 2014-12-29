#!/bin/bash

# Install submodules
git submodule init
git submodule update

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

        # create directory for VIM swap, history, undo etc.
        mkdir -p ~/.vimtmp
}

doIt

# Install Powerline
sudo pip install git+git://github.com/powerline/powerline

# Change shell to zsh
chsh -s /bin/zsh

unset doIt
