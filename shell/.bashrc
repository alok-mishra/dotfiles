##################################### SHELL #####################################
if command -v zsh &> /dev/null; then

    if [ -z "$ZSH_VERSION" ]; then
        : # exec zsh "$@"
    fi

fi

if [ -f ~/.dotfiles/shell/.aliases ]; then
    source ~/.dotfiles/shell/.aliases
    alias via='vi ~/.dotfiles/shell/.aliases'
fi

# if [ `uname` != 'Linux' ]; then
if [[ "$HOSTNAME" ==  W* ]]; then
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

if [[ "$HOSTNAME" ==  Star* ]]; then
    if [ -f ~/.dotfiles/shell/arch.aliases ]; then

        export PATH="/home/alok/sdk/miniconda/bin:$PATH"
        . /home/alok/sdk/miniconda/etc/profile.d/conda.sh

        source ~/.dotfiles/shell/arch.aliases
        alias viaa='vi ~/.dotfiles/shell/arch.aliases'
    fi
fi

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

##################################### PROMPT  #####################################
# Default:  \[\033]0;$MSYSTEM:${PWD//[^[:ascii:]]/?}\007\]\n\[\033[32m\]\u@\h \[\033[33m\]\w $(__git_ps1)\[\033[0m\]\n$
# Simple: export PS1='\W$(__git_ps1 "(%s)") $'
# Colors: 30m Black,  31m Red, 32m - Green, 33m - Yellow, 34m - Blue, 35m - Purple, 36m - Cyan, 37m - White, 0m - Reset, 0 - Normal, 1 - Bold

GIT_PS1_SHOWDIRTYSTATE=true
GIT_PS1_SHOWUNTRACKEDFILES=true

# CYAN Style Prompt
export PS1='\n\[\e[0;36m\]\W\[\e[1;36m\]$(__git_ps1) \[\e[0;36m\]$\[\e[0m\] '

# Directory Colors
# export LS_COLORS='di=0;35:'

windows() { [[ -n "$WINDIR" ]]; }
if windows; then
    alias link=symlink
fi

symlink() {
    if [[ -d "$1" ]]; then # Windows link and target parameters are switched
        cmd <<< "mklink /J \"$2\" \"${1//\//\\}\"" # Directory
    else
        cmd <<< "mklink \"$2\" \"${1//\//\\}\"" # File
    fi
}

function setupNvs {
    export NVS_HOME="$HOME/scoop/apps/nvs/current"
    [ -s "$NVS_HOME/nvs.sh" ] && source "$NVS_HOME/nvs.sh" >>/dev/null
    return 0
}
setupNvs

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
