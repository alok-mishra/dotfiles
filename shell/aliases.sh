# Load local machine-specific aliases
if [ -f ~/local.aliases ]; then
    source ~/local.aliases
fi

# Load common aliases
if [ -f ~/.dotfiles/aliases/.aliases ]; then
    source ~/.dotfiles/aliases/.aliases
    alias via='vi ~/.dotfiles/aliases/.aliases'
fi

# Load git aliases
if [ -f ~/.dotfiles/aliases/git.aliases ]; then
    source ~/.dotfiles/aliases/git.aliases
    alias vigc='vi ~/.gitconfig'
    alias viga='vi ~/.dotfiles/aliases/git.aliases'
fi

# Load PR aliases
if [ -f ~/.dotfiles/aliases/pr.aliases ]; then
    source ~/.dotfiles/aliases/pr.aliases
    alias vipr='vi ~/.dotfiles/aliases/pr.aliases'
elif [ -f ~/pr.aliases ]; then
    source ~/pr.aliases
    alias vipr='vi ~/pr.aliases'
fi

# Load work-specific aliases
if [[ $is_work ]]; then
    if [ -f ~/.dotfiles/aliases/work.aliases ]; then
        source ~/.dotfiles/aliases/work.aliases
        alias viwa='vi ~/.dotfiles/aliases/work.aliases'
    fi
fi

# Load Arch-specific aliases
if [[ $is_arch ]]; then
    if [ -f ~/.dotfiles/aliases/arch.aliases ]; then
        source ~/.dotfiles/aliases/arch.aliases
        alias viaa='vi ~/.dotfiles/aliases/arch.aliases'
    fi
fi
