# Load common aliases
if [ -f ~/.dotfiles/aliases/.aliases ]; then
    source ~/.dotfiles/aliases/.aliases
    alias via='vi ~/.dotfiles/aliases/.aliases'
fi

# Load PR aliases
if [ -f ~/.dotfiles/aliases/pr.aliases ]; then
    source ~/.dotfiles/aliases/pr.aliases
    alias vipr='vi ~/.dotfiles/aliases/pr.aliases'
elif [ -f ~/pr.aliases ]; then
    source ~/pr.aliases
    alias vipr='vi ~/pr.aliases'
fi

# Load environment-specific aliases
if [[ $is_work ]] || [[ "$HOSTNAME" == W* ]]; then
    if [ -f ~/.dotfiles/aliases/work.aliases ]; then
        source ~/.dotfiles/aliases/work.aliases
        alias viwa='vi ~/.dotfiles/aliases/work.aliases'
    fi
else
    if [ -f ~/.dotfiles/aliases/home.aliases ]; then
        source ~/.dotfiles/aliases/home.aliases
        alias viha='vi ~/.dotfiles/aliases/home.aliases'
    fi
fi

# Load OS-specific aliases
if [[ $is_wsl ]]; then
    if [ -f ~/.dotfiles/aliases/arch.aliases ]; then
        source ~/.dotfiles/aliases/arch.aliases
        alias viaa='vi ~/.dotfiles/aliases/arch.aliases'
    fi
elif [[ $(uname -n) == star* ]]; then
    if [ -f ~/.dotfiles/aliases/pop.aliases ]; then
        source ~/.dotfiles/aliases/pop.aliases
        alias vipa='vi ~/.dotfiles/aliases/pop.aliases'
    fi
fi
