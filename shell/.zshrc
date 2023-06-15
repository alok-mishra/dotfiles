# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/c/Users/alok/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

#################### KEYBINDINGS ####################

bindkey '^R' history-incremental-search-backward

#################### ENVIRONMENT ####################

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Powerlevel10k
source ~/.zsh/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# MSYS2 Mingw64 - uncomment MSYS2_PATH_TYPE in mingw64.ini

# unsetopt completealiases ## allows completion of aliases

#################### SHELL ####################

alias viz='vi ~/.zshrc'

if [ -f ~/.dotfiles/shell/.aliases ]; then
    source ~/.dotfiles/shell/.aliases
    alias via='vi ~/.dotfiles/shell/.aliases'
fi

#if [ `uname` != 'Linux' ]; then
if [[ "$HOSTNAME" == W* ]]; then
    if [ -f ~/.dotfiles/shell/work.aliases ]; then
        source ~/.dotfiles/shell/work.aliases
        alias viwa='vi ~/.dotfiles/shell/work.aliases'
    fi

    if [ -f ~/.settings/aliases/pr.aliases ]; then
        source ~/.settings/aliases/pr.aliases
        alias vipr='vi ~/.settings/aliases/pr.aliases'
    fi
else
    if [ -f ~/.dotfiles/shell/home.aliases ]; then
        source ~/.dotfiles/shell/home.aliases
        alias viha='vi ~/.dotfiles/shell/home.aliases'
    fi
fi

if [[ "$HOSTNAME" == Star* ]]; then
    if [ -f ~/.dotfiles/shell/arch.aliases ]; then

        export PATH="/home/alok/sdk/miniconda/bin:$PATH"
        . /home/alok/sdk/miniconda/etc/profile.d/conda.sh

        source ~/.dotfiles/shell/arch.aliases
        alias viaa='vi ~/.dotfiles/shell/arch.aliases'
    fi
fi

# NVS - Node Version Switcher
function setupNvs {
	export NVS_HOME="$HOME\AppData\Local\nvs";
	[ -s "$NVS_HOME/nvs.sh" ] && source "$NVS_HOME/nvs.sh" >> /dev/null;
	return 0;
}
setupNvs
