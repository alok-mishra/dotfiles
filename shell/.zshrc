# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
unsetopt beep
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall

# curl -o ~/.config/git/git-prompt.sh https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh
# curl -o ~/.zsh/_git https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.zsh
# curl -o ~/.zsh/git-completion.bash https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash
fpath=(~/.zsh $fpath)

autoload -Uz compinit && compinit
# End of lines added by compinstall

#################### KEYBINDINGS ####################

bindkey '^R' history-incremental-search-backward

#################### ENVIRONMENT ####################

if [ -f ~/.p10k.zsh ]; then
    # Powerlevel10k - to customize prompt, run `p10k configure` or edit ~/.p10k.zsh.

    # Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
    # Initialization code that may require console input (password prompts, [y/n]
    # confirmations, etc.) must go above this block; everything else may go below.
    if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
    source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
    fi

    source ~/.p10k.zsh
    source ~/.zsh/powerlevel10k/powerlevel10k.zsh-theme

elif command -v starship &> /dev/null; then
    # Starship
    eval "$(starship init zsh)"
fi

# unsetopt completealiases ## allows completion of aliases

#################### SHELL ####################

alias viz='vi ~/.zshrc'
is_wsl=$(uname -a | grep -i microsoft)
is_msys=$(uname -a | grep -i msys)
is_work=$(uname -a | grep -i wit)

if [ -f ~/.dotfiles/shell/.aliases ]; then
    source ~/.dotfiles/shell/.aliases
    alias via='vi ~/.dotfiles/shell/.aliases'
fi

if [ -f ~/.dotfiles/aliases/pr.aliases ]; then
    source ~/.dotfiles/aliases/pr.aliases
    alias vipr='vi ~/.dotfiles/aliases/pr.aliases'
fi


# if [[ `uname -n` == WIT* ]]; then
if [[ $is_work ]]; then
    if [ -f ~/.dotfiles/shell/work.aliases ]; then
        source ~/.dotfiles/shell/work.aliases
        alias viwa='vi ~/.dotfiles/shell/work.aliases'
    fi

    # NVS - Node Version Switcher (Windows)
    function setupNvs {
        export NVS_HOME="$HOME/scoop/apps/nvs/current";
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

if [[ $is_wsl ]]; then
    # NVS - Node Version Switcher (nvs-git via AUR)
    export NVS_HOME="$HOME/.nvs"
    source /opt/nvs/nvs.sh
    # export PATH="$PATH:$NVS_HOME/default/bin/node" # for copilot
    # [ -s "$NVS_HOME/nvs.sh" ] && . "$NVS_HOME/nvs.sh"
    export NODE_PATH="$NVS_HOME/default/lib/node_modules/"

else
    # if [[ `hostname` == star* ]]; then
    #if [[ "$HOSTNAME" == star* ]]; then
    if [[ `uname -n` == star* ]]; then

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

fi
