#!/bin/bash

PACKER_DIRECTORY="$HOME/.local/share/nvim/site/pack/packer/start/packer.nvim"
if [ ! -d "$PACKER_DIRECTORY" ]; then
    git clone --depth 1 https://github.com/wbthomason/packer.nvim $PACKER_DIRECTORY
fi
