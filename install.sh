#!/bin/bash

function osx() {
  # Check for Homebrew install,
  # install if not found
  if test ! $(which brew); then
    echo "Installing homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  fi

  # Install dotfile dependencies and other userful things
  brew update
  brew tap iveney/mocha # has realpath
  brew install realpath
	brew install neovim
	brew install tmux
	brew install fish
  brew install lazygit
  brew install node
  brew install nvm
  brew install jandedobbeleer/oh-my-posh/oh-my-posh

  # Fish
  curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source && fisher install jorgebucaran/fisher
}

function doIt() {
	mkdir -p ~/.config
	mkdir -p ~/.nvm
  touch ~/.secrets
	for SOURCE in nvim fish
	do
		ln -hfis "$(realpath $SOURCE)" ~/.config
	done
  ln -hfis "$(realpath tmux/.tmux)" ~
  ln -hfis "$(realpath tmux/.tmux.conf)" ~
	unset SOURCE
}

if [[ "$OSTYPE" == "darwin"* ]]
then 
  osx
fi

doIt

unset doIt
unset osx
