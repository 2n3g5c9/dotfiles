#!/bin/bash

PACKER_DIRECTORY="$HOME/.local/share/nvim/site/pack/packer/start/packer.nvim"
if [ ! -d "$PACKER_DIRECTORY" ]; then
    git clone --depth 1 https://github.com/wbthomason/packer.nvim $PACKER_DIRECTORY
fi

npm i -g ansible-language-server bash-language-server dockerfile-language-server-nodejs pyright @tailwindcss/language-server typescript typescript-language-server vim-language-server vscode-langservers-extracted yaml-language-server
