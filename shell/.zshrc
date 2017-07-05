# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/alok/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

#################################################################################

bindkey '^R' history-incremental-search-backward

##################################### SHELL #####################################
if [ -f ~/.dotfiles/shell/.aliases ]; then
    source ~/.dotfiles/shell/.aliases
    alias via='vi ~/.dotfiles/shell/.aliases'
fi

if [ -f ~/.dotfiles/shell/home.aliases ]; then
    source ~/.dotfiles/shell/home.aliases
    alias viha='vi ~/.dotfiles/shell/home.aliases'
fi

# Antigen - The plugin manager for zsh.
source /usr/share/zsh/share/antigen.zsh


# # Load the oh-my-zsh's library.
# antigen use oh-my-zsh
#
# # Bundles from the default repo (robbyrussell's oh-my-zsh).
# antigen bundle git
#
# # Syntax highlighting bundle.
# antigen bundle zsh-users/zsh-syntax-highlighting
#
# # Load the theme.
# antigen theme sorin
#
# # Tell antigen that you're done.
# antigen apply
