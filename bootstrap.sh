#!/usr/bin/env bash

brew-installs() {
	command -v brew >/dev/null 2>&1 || { echo >&2 " ==> Installing Homebrew"; \
    	/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"; }

  	echo " ==> Installing software with Homebrew"
  	brew bundle

  	echo " ==> Cleaning up Homebrew installs"
  	brew cleanup
}

additional-installs() {
	if [ ! -d "${HOME}/.oh-my-zsh" ]; then
		echo " ==> Installing Oh My Zsh"
		sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
	fi

	VIM_PLUG="${HOME}/.config/nvim/autoload/plug.vim"
	if [ ! -f "${VIM_PLUG}" ]; then
		echo " ==> Installing vim-plug"
		curl -fLo "${VIM_PLUG}" --create-dirs \
			https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	fi
}

pip-installs() {
	echo " ==> Installing Python modules"
	pip3 install pynvim
	sudo pip3 install haxor-news
}

copy-dotfiles() {
	echo " ==> Copying dotfiles"

	cp config/zsh/zshrc "${HOME}/.zshrc"
	cp config/aliases/aliases "${HOME}/.aliases"
	cp config/aliases/aliases_kubectl "${HOME}/.aliases_kubectl"

	cp config/tmux/tmux.conf "${HOME}/.tmux.conf"

	cp config/git/gitaliases.txt "${HOME}/.gitaliases.txt"
	cp config/git/gitconfig "${HOME}/.gitconfig"
	
	mkdir -p "${HOME}/.config/nvim"
	cp config/vim/init.vim "${HOME}/.config/nvim/init.vim"

	mkdir -p "${HOME}/.config/ranger"
	cp config/ranger/rc.conf "${HOME}/.config/ranger/rc.conf"
}

do-it() {
	# Brew installs.
	brew-installs

	# Additional installs.
	additional-installs

	# Python modules installs.
	pip-installs

	# Copy dotfiles in appropriate directories.
	copy-dotfiles
}

if [ "$1" == "--force" ] || [ "$1" == "-f" ]; then
	do-it;
else
	read -r -p "This may overwrite existing files in your home directory. Are you sure? (y/n) " -n 1;
	echo "";
	if [[ $REPLY =~ ^[Yy]$ ]]; then
		do-it;
	fi;
fi;
