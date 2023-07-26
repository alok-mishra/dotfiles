# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
unsetopt beep
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/alok/.zshrc'

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

# unsetopt completealiases ## allows completion of aliases

#################### SHELL ####################

alias viz='vi ~/.zshrc'

if [ -f ~/.dotfiles/shell/.aliases ]; then
    source ~/.dotfiles/shell/.aliases
    alias via='vi ~/.dotfiles/shell/.aliases'
fi

if [[ `hostname` == W* ]]; then
    if [ -f ~/.dotfiles/shell/work.aliases ]; then
        source ~/.dotfiles/shell/work.aliases
        alias viwa='vi ~/.dotfiles/shell/work.aliases'
    fi

    # NVS - Node Version Switcher (Windows)
    function setupNvs {
        export NVS_HOME="$HOME\AppData\Local\nvs";
        [ -s "$NVS_HOME/nvs.sh" ] && source "$NVS_HOME/nvs.sh" >> /dev/null;
        return 0;
    }
    setupNvs

else
    if [ -f ~/.dotfiles/shell/home.aliases ]; then
        source ~/.dotfiles/shell/home.aliases
        alias viha='vi ~/.dotfiles/shell/home.aliases'
    fi
fi

if [ -f ~/.dotfiles/aliases/pr.aliases ]; then
    source ~/.dotfiles/aliases/pr.aliases
    alias vipr='vi ~/.dotfiles/aliases/pr.aliases'
fi

if [[ `hostname` == star* ]]; then

    if [ -f ~/.dotfiles/shell/pop.aliases ]; then
        source ~/.dotfiles/shell/pop.aliases
        alias vipa='vi ~/.dotfiles/shell/pop.aliases'

    #     export PATH="/home/alok/sdk/miniconda/bin:$PATH"
    #     . /home/alok/sdk/miniconda/etc/profile.d/conda.sh
    fi

    # NVS - Node Version Switcher (Linux)
    export NVS_HOME="$HOME/.nvs"
    export PATH="$PATH:$NVS_HOME/default/bin/node" # for copilot
    [ -s "$NVS_HOME/nvs.sh" ] && . "$NVS_HOME/nvs.sh"
    export NODE_PATH="$NVS_HOME/default/lib/node_modules/"

    # Linuxbrew env set in ~/.profile (upon login for GUI apps)
fi


# export PATH="$HOME/bin:$PATH"
