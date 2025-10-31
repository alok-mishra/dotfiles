# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
unsetopt beep
setopt nullglob
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

#################### SHARED CONFIG ####################

# Source shared configurations
if [ -f ~/.dotfiles/config/shell/env.sh ]; then
    source ~/.dotfiles/config/shell/env.sh
fi

if [ -f ~/.dotfiles/config/shell/functions.sh ]; then
    source ~/.dotfiles/config/shell/functions.sh
fi

#################### SHELL ####################

alias viz='vi ~/.zshrc'
# Load shared aliases configuration
if [ -f ~/.dotfiles/config/shell/aliases.sh ]; then
    source ~/.dotfiles/config/shell/aliases.sh
fi

if [[ $is_work ]]; then
    # NVS - Node Version Switcher (Windows)
    function setupNvs {
        export NVS_HOME="$HOME/scoop/apps/nvs/current";
        [ -s "$NVS_HOME/nvs.sh" ] && source "$NVS_HOME/nvs.sh" >> /dev/null;
        # nvs auto on >> /dev/null
        return 0
    }
    setupNvs

    if [[ $is_msys ]]; then
        IP_ADDRESS=$(ipconfig | grep -m 1 "IPv4" | cut -d: -f2 | tr -d ' ')
    elif [[ $is_wsl ]]; then
        IP_ADDRESS=$(ip addr show | grep -A 3 "eth.*state UP" | grep 'inet ' | head -1 | awk '{print $2}' | cut -d/ -f1)
    fi

    # Set proxies if NOT on home network
    MY_LOCATION="home"
    if [[ "$IP_ADDRESS" != 192.168.* ]]; then
        MY_LOCATION="work"
        export http_proxy="http://localhost:6060"
        export https_proxy="http://localhost:6060"
        export no_proxy="localhost,127.0.0.1"
        echo "PX Proxy: $https_proxy"
    fi
    export MY_LOCATION

else
    if [ -f ~/.dotfiles/aliases/home.aliases ]; then
        source ~/.dotfiles/aliases/home.aliases
        alias viha='vi ~/.dotfiles/aliases/home.aliases'
    fi
fi

if [[ $is_wsl ]]; then

    #export GALLIUM_DRIVER=d3d12
    export GALLIUM_DRIVER=llvmpipe
    export LIBVA_DRIVER_NAME=d3d12
    export XDG_SESSION_TYPE=wayland
    export MOZ_ENABLE_WAYLAND=1
    export MOZ_WEBRENDER=1
    # export MESA_LOADER_DRIVER_OVERRIDE=d3d12  # Force D3D12 driver

    if [[ "$MY_LOCATION" == home ]]; then
        export GDK_DPI_SCALE=1.25
        export XCURSOR_SIZE=32
        export QT_SCALE_FACTOR=1.25
    fi

    if [ -f ~/.dotfiles/aliases/arch.aliases ]; then
        source ~/.dotfiles/aliases/arch.aliases
        alias viaa='vi ~/.dotfiles/aliases/arch.aliases'
    fi

    # NVS - Node Version Switcher (nvs-git via AUR)
    export NVS_HOME="$HOME/.nvs"
    source /opt/nvs/nvs.sh
    # export PATH="$PATH:$NVS_HOME/default/bin/node" # for copilot
    # [ -s "$NVS_HOME/nvs.sh" ] && . "$NVS_HOME/nvs.sh"
    export NODE_PATH="$NVS_HOME/default/lib/node_modules/"

    export GOPATH="$HOME/go"
    export PATH="$PATH:$(go env GOBIN):$(go env GOPATH)/bin"

    # Poetry - Python Package Manager
    export PATH="$HOME/.local/bin:$PATH"

    LFCD="/home/alok/.config/lf/lfcd.sh"
    if [ -f "$LFCD" ]; then
        source "$LFCD"
        alias lf='lfcd'
    fi

    eval "$(zoxide init zsh)"

else
    # if [[ `hostname` == star* ]]; then
    #if [[ "$HOSTNAME" == star* ]]; then
    if [[ `uname -n` == star* ]]; then

        if [ -f ~/.dotfiles/aliases/pop.aliases ]; then
            source ~/.dotfiles/aliases/pop.aliases
            alias vipa='vi ~/.dotfiles/aliases/pop.aliases'
        fi

        # NVS - Node Version Switcher (Linux)
        export NVS_HOME="$HOME/.nvs"
        export PATH="$PATH:$NVS_HOME/default/bin/node" # for copilot
        [ -s "$NVS_HOME/nvs.sh" ] && . "$NVS_HOME/nvs.sh"
        export NODE_PATH="$NVS_HOME/default/lib/node_modules/"

        # Linuxbrew env set in ~/.profile (upon login for GUI apps)
    fi

fi
