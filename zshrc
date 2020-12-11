# General
export PATH=/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin

export VISUAL=nvim
export EDITOR=nvim

export ZSH="$HOME/.oh-my-zsh"

export TERM="screen-256color"
ZSH_THEME="spaceship"

source $ZSH/oh-my-zsh.sh

# Plugins
plugins=(
  git
  zsh-syntax-highlighting
  zsh-autosuggestions
  z
)

# Aliases
[ -f $HOME/.aliases ] && source $HOME/.aliases
[ -f $HOME/.kubectl_aliases ] && source $HOME/.kubectl_aliases
eval $(thefuck --alias)

# fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_COMMAND='rg --files --no-ignore-vcs --hidden'

# Golang (Development)
export GOPATH="${HOME}/.go"
export GOROOT="$(brew --prefix golang)/libexec"
export PATH="$PATH:${GOPATH}/bin:${GOROOT}/bin"

# Kubernetes
#function kubectl() { echo "+ kubectl $@">&2; command kubectl $@; }
#source <(kubectl completion zsh)
#complete -F __start_kubectl k

# The Fuck
eval $(thefuck --alias)

# MacOS GPG fix
export GPG_TTY=$(tty)
