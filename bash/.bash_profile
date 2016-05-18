# Default Prompt
# \[\033]0;$MSYSTEM:${PWD//[^[:ascii:]]/?}\007\]\n\[\033[32m\]\u@\h \[\033[33m\]\w $(__git_ps1)\[\033[0m\]\n$

# Simple
# export PS1='\W$(__git_ps1 "(%s)") $'

GIT_PS1_SHOWDIRTYSTATE=true
GIT_PS1_SHOWUNTRACKEDFILES=true

# 30m - Black
# 31m - Red
# 32m - Green
# 33m - Yellow
# 34m - Blue
# 35m - Purple
# 36m - Cyan
# 37m - White
# 0m - Reset
# 0 - Normal
# 1 - Bold

# CYAN Style Prompt
export PS1='\n\[\e[0;36m\]\W\[\e[1;36m\]$(__git_ps1) \[\e[0;36m\]$\[\e[0m\] '

# Directory Colors
# export LS_COLORS='di=0;35:'

##################################### DOCKER #####################################
export DOCKER_TLS_VERIFY="1"
export DOCKER_HOST="tcp://192.168.99.100:2376"
export DOCKER_CERT_PATH="C:\Users\t5005a0\.docker\machine\machines\devbox"
export DOCKER_MACHINE_NAME="devbox"

alias dnmf='export DOCKER_MACHINE_NAME="finance"'

##################################### BASH #####################################

if [ -f ~/.dotfiles/bash/.bash_aliases ]; then
    source ~/.dotfiles/bash/.bash_aliases
    alias vba='vi ~/.dotfiles/bash/.bash_aliases'
fi

alias md5='openssl md5'
alias sha1='openssl sha1'
alias ln=symlink
alias path='echo "${PATH//:/$'"'"'\n'"'"'}"'
alias sshc='ssh-copy-id -i ~/.ssh/id_rsa'

alias vi='start //b gvim'
alias vb='vi ~/.bash_profile'
alias vj='vi manifest.json'
alias nm='node manifest'
alias gurp='gars && gulp'
# alias rocky='./cntlm -c cntlm.ini -M https://www.google.com'
alias rocky='./cntlm -H -c cntlm.ini'
# alias grep='grep --color=auto'

# ATOM
alias alp='apm list --installed --bare > ~/Dropbox/dotfiles/.atom/.packages'
alias aip='apm install --packages-file ~/Dropbox/dotfiles/.atom/.packages'
alias aiv='apm install --verbose'

windows() { [[ -n "$WINDIR" ]]; }

symlink() {
    if windows; then
        if [[ -d "$1" ]]; then # Windows link and target parameters are switched
            cmd <<< "mklink /D \"$2\" \"${1//\//\\}\"" # Directory
        else
            cmd <<< "mklink \"$2\" \"${1//\//\\}\"" # File
        fi
    else
        ln -s "$1" "$2" # Linux parameters
    fi
}

##################################### SSH #####################################

pssh() {
    if [ `uname -n` != 'Pulsar' ]; then
        cat ~/.ssh/config.proxy  ~/.ssh/config > /tmp/ssh_config
        command ssh -F /tmp/ssh_config $1
    else
        command ssh $1
    fi
}


##################################### ANDROID #####################################
#Android Platform Tools
PATH=$PATH:~/android-sdk/platform-tools/:~/android-sdk/tools/

# Android aliases
alias avd='emulator -avd galaxy -no-audio -http-proxy http://127.0.0.1:6060'
alias adbi='adb install'
alias adbu='adb uninstall'

##################################### GIT #####################################

# Set a environment variable for the repository
repo=file:///C:/Workspace/Repository/Git

##################################### GO #####################################
alias gor='go run'
