# Shared shell functions

windows() { [[ -n "$WINDIR" ]]; }

symlink() {
    if windows; then
        if [[ -d "$1" ]]; then
            cmd <<< "mklink /J \"$2\" \"${1//\//\\}\"" # Directory
        else
            cmd <<< "mklink \"$2\" \"${1//\//\\}\"" # File
        fi
    else
        ln -s "$1" "$2"
    fi
}

if [[ -n "$BASH_VERSION" ]]; then
    if ! declare -f __git_ps1 > /dev/null; then
        [[ -f /usr/share/git-core/contrib/completion/git-prompt.sh ]] && \
            source /usr/share/git-core/contrib/completion/git-prompt.sh
    fi

    if declare -f __git_ps1 > /dev/null; then
        GIT_PS1_SHOWDIRTYSTATE=true
        GIT_PS1_SHOWUNTRACKEDFILES=true

        SSH_INDICATOR=""
        if [[ -n "$SSH_TTY" ]]; then
            if [[ -n "$SSH_AUTH_SOCK" ]]; then
                SSH_INDICATOR="🔑 "
            else
                SSH_INDICATOR="🔐 "
            fi
        fi

        export PS1='\n\[\e[0;36m\]'"$SSH_INDICATOR"'\W\[\e[1;36m\]$(__git_ps1) \[\e[0;36m\]$\[\e[0m\] '
    fi
fi
