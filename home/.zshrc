HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
unsetopt beep
setopt nullglob

autoload -Uz compinit && compinit

#################### KEYBINDINGS ####################

bindkey -v  # Enable vi mode
bindkey '^R' history-incremental-search-backward

#################### ENVIRONMENT ####################

# User-local binaries (pipx, poetry, cargo, pip --user, etc.)
export PATH="$HOME/.local/bin:$PATH"

if command -v starship &> /dev/null; then
    STARSHIP_CONFIG=${HOME}/.config/starship.toml
    eval "$(starship init zsh)"

elif [ -f ~/.p10k.zsh ]; then
    # Powerlevel10k fallback (Windows)
    if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
        source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
    fi

    source ~/.p10k.zsh
    source ~/.zsh/powerlevel10k/powerlevel10k.zsh-theme
fi

#################### SHARED CONFIG ####################

# Source shared configurations
if [ -f ~/.dotfiles/shell/env.sh ]; then
    source ~/.dotfiles/shell/env.sh
fi

if [ -f ~/.dotfiles/shell/functions.sh ]; then
    source ~/.dotfiles/shell/functions.sh
fi

#################### SHELL ####################

# Load shared aliases configuration
if [ -f ~/.dotfiles/shell/aliases.sh ]; then
    source ~/.dotfiles/shell/aliases.sh
fi

#################### ENVIRONMENT-SPECIFIC ####################

# Work environment (location detection for proxies)
PROXY="172.25.144.1:6060"

set_home_network() {
    unset http_proxy https_proxy no_proxy HTTP_PROXY HTTPS_PROXY NO_PROXY
    [[ -n "$WINDIR" ]] && command -v scoop &> /dev/null && scoop config rm proxy
    export MY_LOCATION="home"
    [[ "$1" == "verbose" ]] && echo "Switched to Home network!"
}
alias home='set_home_network verbose'

set_work_network() {
    export http_proxy="http://$PROXY"
    export https_proxy="http://$PROXY"
    export no_proxy="localhost,127.0.0.1"
    [[ -n "$WINDIR" ]] && command -v scoop &> /dev/null && scoop config proxy $PROXY
    export MY_LOCATION="work"
    echo "Switched to Work network! (proxy: $PROXY)"
}
alias work='set_work_network'

if [[ $is_wit ]]; then
    MY_LOCATION="home"

    if [[ $is_wsl ]]; then
        unset HTTP_PROXY HTTPS_PROXY NO_PROXY # Clear windows proxy, for apps that check uppercase (i.e. rclone)
        # WSL2 always shows the NAT IP, probe the proxy port directly
        timeout 0.2 bash -c "echo > /dev/tcp/${PROXY%:*}/${PROXY#*:}" &>/dev/null && MY_LOCATION="work"
    fi

    if [[ "$MY_LOCATION" == work ]]; then
        set_work_network
    else
        set_home_network
    fi
fi

# WSL-specific configuration
if [[ $is_wsl ]]; then
    # Graphics and Wayland
    export GALLIUM_DRIVER=llvmpipe
    export LIBVA_DRIVER_NAME=d3d12
    export XDG_SESSION_TYPE=wayland
    export MOZ_ENABLE_WAYLAND=1
    export MOZ_WEBRENDER=1

    # DPI scaling (home network only)
    if [[ "$MY_LOCATION" == home ]]; then
        export GDK_DPI_SCALE=1.25
        export XCURSOR_SIZE=32
        export QT_SCALE_FACTOR=1.25
    fi

fi

#################### TOOLS ####################

setupNvs
setupGo
setupZoxide
