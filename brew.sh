#!/bin/bash

# Check to see if Homebrew is installed, and install it if it is not.
command -v brew >/dev/null 2>&1 || { echo >&2 "Installing Homebrew Now"; \
	/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"; }

# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade

# Save Homebrew’s installed location.
BREW_PREFIX=$(brew --prefix)

# Install GNU core utilities (those that come with macOS are outdated).
# Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
brew install coreutils
ln -s "${BREW_PREFIX}/bin/gsha256sum" "${BREW_PREFIX}/bin/sha256sum"

# Install some other useful utilities like `sponge`.
brew install moreutils
# Install GNU `find`, `locate`, `updatedb`, and `xargs`, `g`-prefixed.
brew install findutils
# Install GNU `sed`, overwriting the built-in `sed`.
brew install gnu-sed --with-default-names
# Install a modern version of Bash.
brew install bash
brew install bash-completion2
# Install a modern verison of zsh.
brew install zsh

# Switch to using brew-installed zsh as default shell
if ! fgrep -q "${BREW_PREFIX}/bin/zsh" /etc/shells; then
  echo "${BREW_PREFIX}/bin/zsh" | sudo tee -a /etc/shells;
  chsh -s "${BREW_PREFIX}/bin/zsh";
fi;

# Install GnuPG to enable PGP-signing commits.
brew install gnupg

# Install more recent versions of some macOS tools.
brew install ack
brew install gawk
brew install grep
brew install openssh
brew install tree

# Install useful utilities.
brew install aria2
brew install curl
brew install fzf
brew install htop
brew install pigz

# Install development environment.
brew install git
brew install git-lfs
brew install go
brew install neovim
brew install python && pip3 install --user pynvim
brew install tmux

# Install Homebrew Cask.
brew tap caskroom/cask

# Install Cask software.
brew cask install alfred
brew cask install docker
brew cask install iterm2
brew cask install firefox
brew cask install font-hack-nerd-font
brew cask install google-chrome
brew cask install vlc

# Remove outdated versions from the cellar.
brew cleanup
