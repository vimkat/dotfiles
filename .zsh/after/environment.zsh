# ===== General Terminal Experience ===== #
export CDPATH=$HOME/Developer/repositories
export EDITOR="nvim"


# ===== Golang ===== #
export GOPATH=$HOME/Developer/go
export PATH=$PATH:$GOPATH/bin

# ===== GNU tools vs. BSD tools ===== #
export PATH="/usr/local/opt/gnu-sed/libexec/gnubin:$PATH"
export PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
export PATH="/usr/local/opt/grep/libexec/gnubin:$PATH"


# ===== FZF (Fuzzy Finder) ===== "
export FZF_DEFAULT_COMMAND='rg --files --follow --hidden'
