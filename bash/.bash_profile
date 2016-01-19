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

##################################### DOCKER #####################################
export DOCKER_TLS_VERIFY="1"
export DOCKER_HOST="tcp://192.168.99.100:2376"
export DOCKER_CERT_PATH="C:\Users\t5005a0\.docker\machine\machines\devbox"
export DOCKER_MACHINE_NAME="devbox"


##################################### BASH #####################################
alias l='ls -lAF'
alias ..='cd ..'
alias ocd='cd "$OLDPWD"'
alias md5='openssl md5'
alias sha1='openssl sha1'
alias ln=symlink

alias vi='start //b gvim'
alias vb='vi ~/.bash_profile'
alias vj='vi manifest.json'
alias nm='node manifest'
alias ns='node shellcolor'
# alias rocky='./cntlm -c cntlm.ini -M https://www.google.com'
alias rocky='./cntlm -H -c cntlm.ini'
# alias grep='grep --color=auto'

# DOCKER
alias dm='docker-machine'
alias dmip='docker-machine ip devbox'
alias denv='docker-machine env devbox --shell bash'

alias dp='docker ps -a'
alias dps='docker ps --format "table {{.ID}}\t{{.Image}}\t{{.Command}}\t{{.Ports}}\t{{.Names}}"'
alias dpa='docker ps -a --format "table {{.ID}}\t{{.Image}}\t{{.Command}}\t{{.Ports}}\t{{.Names}}"'


alias dat=attach_terminal
attach_terminal() { docker exec -it "$1" bash; }

alias dim='docker images'

alias dsa='docker start $(docker ps -a -q)'
alias dSa='docker stop $(docker ps -a -q)'

alias dRm='docker rm'
# alias dRa='docker rm $(docker ps -a -q)'

# ATOM
alias alp='apm list --installed --bare > ~/Dropbox/dotfiles/.atom/.packages'
alias aip='apm install --packages-file ~/Dropbox/dotfiles/.atom/.packages'

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

ssh() {
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
alias ai='adb install'
alias au='adb uninstall'

##################################### GIT #####################################

# Set a environment variable for the repository
repo=file:///C:/Workspace/Repository/Git


if [ -f ~/.dotfiles/prezto/modules/git/alias.zsh ]; then
    source ~/.dotfiles/prezto/modules/git/alias.zsh 2> /dev/null
    alias vgp='vi ~/.dotfiles/prezto/modules/git/alias.zsh'
fi 

if [ -f ~/.dotfiles/git/aliases.zsh ]; then
    source ~/.dotfiles/git/aliases.zsh
    alias vgg='vi ~/.dotfiles/git/aliases.zsh'
fi 

##################################### GO #####################################
alias gor='go run'
