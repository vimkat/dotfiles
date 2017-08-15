#
# .zshrc
# Dotfiles
#
# Created 15/8/17 by Nils Weber
# Copyright (C) Nils Weber
#
# This .zshrc file loads the ZSH configuration from the .zsh folder
#


# Load all files from .zsh directory
if [ -d $HOME/.zsh ]; then
  for file in $HOME/.zsh/*.zsh; do
    source $file
  done
fi
