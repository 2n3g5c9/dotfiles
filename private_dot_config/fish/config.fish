set fish_greeting ""

set -gx TERM xterm-256color
set -gx EDITOR nvim

set -x -g LC_ALL en_GB.UTF-8
set -x -g LANG en_GB.UTF-8

# Aliases
source ~/.aliases

# Local binaries
set -gx PATH $HOME/bin $PATH

# Brew
fish_add_path /opt/homebrew/bin
fish_add_path /opt/homebrew/sbin

# Starship
starship init fish | source

# The Fuck
thefuck --alias | source

# zoxide
zoxide init fish | source
