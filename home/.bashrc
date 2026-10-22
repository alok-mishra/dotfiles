# Skip configuration for non-interactive shells (scp, rsync, etc.)
[[ $- != *i* ]] && return

#################### SHARED CONFIG ####################

if [ -f ~/.dotfiles/shell/env.sh ]; then
    source ~/.dotfiles/shell/env.sh
fi

if [ -f ~/.dotfiles/shell/functions.sh ]; then
    source ~/.dotfiles/shell/functions.sh
fi

if [ -f ~/.dotfiles/shell/aliases.sh ]; then
    source ~/.dotfiles/shell/aliases.sh
fi


#################### SHELL ####################

if command -v nvim >/dev/null 2>&1; then
    export EDITOR="nvim"
elif command -v vim >/dev/null 2>&1; then
    export EDITOR="vim"
else
    export EDITOR="vi"
fi

export VISUAL="$EDITOR"


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

setupFnm
setupGo
setupZoxide
