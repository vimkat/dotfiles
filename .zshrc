#
# .zshrc
# Dotfiles
#
# Created 15/8/17 by Nils Weber
# Copyright (C) Nils Weber
#
# This .zshrc file loads plugins using Antigen and afterwards sources
# the additional ZSH configuration from the ~/.zsh folder.
#

# Load all files from ~/.zsh/before
if [ -d $HOME/.zsh/before ]; then
  for file in $HOME/.zsh/before/*.zsh; do
    source $file
  done
fi

# Source Antigen.
source /usr/local/share/antigen/antigen.zsh

# Load plugins.
antigen bundle robbyrussell/oh-my-zsh lib/		        # Oh-My-ZSH core (contains mostly useful stuff)
antigen bundle git					                          # Git integration
antigen bundle ssh-agent				                      # Start ssh-agent
antigen bundle zsh-users/zsh-syntax-highlighting	    # Enable syntax highlighting
antigen bundle zsh-users/zsh-autosuggestions          # Fish-like autosuggestions
antigen bundle lukechilds/zsh-nvm                     # Node version manager

# Tell Antigen we're done.
antigen apply

# Load all files from ~/.zsh/after
if [ -d $HOME/.zsh/after ]; then
  for file in $HOME/.zsh/after/*.zsh; do
    source $file
  done
fi
