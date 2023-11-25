# Go
set -g GOPATH $HOME/go
set -gx PATH $GOPATH/bin $PATH

# pnpm
set -gx PNPM_HOME "/Users/marc/Library/pnpm"
if not string match -q -- $PNPM_HOME $PATH
  set -gx PATH "$PNPM_HOME" $PATH
end
