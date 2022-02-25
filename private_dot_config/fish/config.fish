set fish_greeting ""

set -gx TERM xterm-256color
set -gx EDITOR nvim

set -x -g LC_ALL en_GB.UTF-8
set -x -g LANG en_GB.UTF-8

# Theme
if status --is-interactive
    theme_gruvbox dark medium
end

# Aliases
source ~/.aliases

# Brew
fish_add_path /opt/homebrew/bin
fish_add_path /opt/homebrew/sbin

# Go
set -g GOPATH $HOME/go
set -gx PATH $GOPATH/bin $PATH

# Google Cloud SDK
source /opt/homebrew/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.fish.inc

# The Fuck
thefuck --alias | source

starship init fish | source
