# Skip configuration for non-interactive shells (scp, rsync, etc.)
[[ $- != *i* ]] && return

#################### SHARED CONFIG ####################

# Source shared configurations
if [ -f ~/.dotfiles/shell/env.sh ]; then
    source ~/.dotfiles/shell/env.sh
fi

if [ -f ~/.dotfiles/shell/functions.sh ]; then
    source ~/.dotfiles/shell/functions.sh
fi

#################### SHELL ####################

# Load shared aliases
if [ -f ~/.dotfiles/shell/aliases.sh ]; then
    source ~/.dotfiles/shell/aliases.sh
fi

# Git completion
if [ -d /mingw64/share/git/completion/ ]; then
    source /mingw64/share/git/completion/git-completion.bash
    source /mingw64/share/git/completion/git-prompt.sh
fi

if [ -d /usr/share/git/completion/ ]; then
    source /usr/share/git/completion/git-completion.bash
    source /usr/share/git/completion/git-prompt.sh

    __git_complete gch _git_checkout
    __git_complete gm _git_merge
    __git_complete gp _git_pull
fi

# Windows-specific
if windows; then
    alias link=symlink
fi

#################### TOOLS ####################

setupNvs
setupGo
setupZoxide
