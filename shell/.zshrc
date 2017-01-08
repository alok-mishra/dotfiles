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


##################################### SHELL #####################################
if [ -f ~/.dotfiles/shell/.aliases ]; then
    source ~/.dotfiles/shell/.aliases
    alias via='vi ~/.dotfiles/shell/.aliases'
fi

if [ -f ~/.dotfiles/shell/home.aliases ]; then
    source ~/.dotfiles/shell/home.aliases
    alias viha='vi ~/.dotfiles/shell/home.aliases'
fi

