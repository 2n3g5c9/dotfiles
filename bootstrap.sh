#!/bin/bash

git pull origin master;

additional-installs() {
    echo "Install Oh My Zsh"
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

    echo "Install Spaceship ZSH"
    git clone https://github.com/denysdovhan/spaceship-prompt.git "$ZSH_CUSTOM/themes/spaceship-prompt"
    ln -s "$ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh-theme" "$ZSH_CUSTOM/themes/spaceship.zsh-theme"

    echo "Install vim-plug"
    curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
}

copy-dotfiles() {
    cp zshrc $HOME/.zshrc
    cp aliases $HOME/.aliases

    cp tmux.conf $HOME/.tmux.conf
    cp tmux.conf.local $HOME/.tmux.conf.local

    mkdir -p $HOME/.config/nvim
    cp init.vim $HOME/.config/nvim/init.vim
}

do-it() {
    # Additional installs.
    additional-installs

    # Copy dotfiles in appropriate directories.
    copy-dotfiles
}

if [ "$1" == "--force" -o "$1" == "-f" ]; then
	do-it;
else
	read -p "This may overwrite existing files in your home directory. Are you sure? (y/n) " -n 1;
	echo "";
	if [[ $REPLY =~ ^[Yy]$ ]]; then
		do-it;
	fi;
fi;
