##################################### SHELL #####################################
if [ -f ~/.dotfiles/shell/.aliases ]; then
    source ~/.dotfiles/shell/.aliases
    alias via='vi ~/.dotfiles/shell/.aliases'
fi

if [ `uname` != 'Linux' ]; then
    if [ -f ~/.dotfiles/shell/work.aliases ]; then
        source ~/.dotfiles/shell/work.aliases
        alias viwa='vi ~/.dotfiles/shell/work.aliases'
    fi
else
    if [ -f ~/.dotfiles/shell/home.aliases ]; then
        source ~/.dotfiles/shell/home.aliases
        alias viha='vi ~/.dotfiles/shell/home.aliases'
    fi

    if [ -f ~/.dotfiles/shell/arch.aliases ]; then
        source ~/.dotfiles/shell/arch.aliases
        alias viaa='vi ~/.dotfiles/shell/arch.aliases'
    fi
fi

if [ -d /usr/share/git/completion/ ]; then
    source /usr/share/git/completion/git-completion.bash
    source /usr/share/git/completion/git-prompt.sh
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

alias ln=symlink
symlink() {
    if windows; then
        if [[ -d "$1" ]]; then # Windows link and target parameters are switched
            cmd <<< "mklink /J \"$2\" \"${1//\//\\}\"" # Directory
        else
            cmd <<< "mklink \"$2\" \"${1//\//\\}\"" # File
        fi
    else
        ln -s "$1" "$2" # Linux parameters
    fi
}
