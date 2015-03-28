# Default Prompt
# \[\033]0;$MSYSTEM:${PWD//[^[:ascii:]]/?}\007\]\n\[\033[32m\]\u@\h \[\033[33m\]\w $(__git_ps1)\[\033[0m\]\n$

# Simple
# export PS1='\W$(__git_ps1 "(%s)") $'

GIT_PS1_SHOWDIRTYSTATE=1

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

##################################### BASH #####################################
alias l='ls -lAF'
alias ..='cd ..'
alias ocd='cd "$OLDPWD"'
alias md5='openssl md5'
alias sha1='openssl sha1'
alias ln=symlink

alias vi='start gvim'
alias vb='start gvim ~/.bash_profile'
alias vj='vi manifest.json'
alias nm='node manifest'
alias grep='grep --color=auto'

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

alias g='git'

alias gi='git init'
alias gib='git init --bare'
alias gs='git status'
alias ga='git add'
alias gaa='git add --all'


# Branch / Checkout
alias gb='git branch'
alias gbm='git branch --merged'

alias gch='git checkout'
alias gchb='git checkout -b'
alias gchm='git checkout master'
alias gchf='git checkout master --'

alias gd='git diff'
alias gdt='git difftool'
alias gdm='git diff master'

alias stash='git stash'
alias pop='git stash pop'
alias reset='git reset --soft HEAD~1'


# Fetch / Merge / Pull
alias gm='git merge'
alias gmm='git merge master'
alias gmt='git mergetool'

alias gf='git fetch'
alias gp='git pull'
alias gpd1='git pull --depth 1'


# Commit
alias gco='git commit -m'
alias gca='git commit -am'


# Submodules
alias gsa='git submodule add -b master'
alias gsu='git submodule update'
alias gsr='git submodule foreach --recursive'
alias gps='git pull --recurse-submodules'


# Remotes
alias gr='git remote -v'


# Logs
alias glo='git log --oneline -10'
alias glog='glo --graph --all --decorate'


# Clone
alias gcl='git clone'
alias gcld1='git clone --depth 1'


# Repos
alias gcla='git clone --local $repo/Assembly.git'
alias gclar='git clone --recursive --local $repo/Assembly.git'
alias gclp='git clone --local $repo/Package.git'
alias gclm='git clone --local $repo/manifest.git'
alias gclv='git clone --local $repo/video.git'
alias gclas='git clone --local $repo/classes.git'
alias gclf='git clone --local $repo/fla.git'


# Archive / Extract
alias gar='git archive HEAD --format=zip > "../${PWD##*/}.zip"'
alias gara='git archive --remote=$repo/Assembly.git master | tar -xv'
alias gars='git archive --remote=$repo/Assembly.git master | tar -xv shell/scripts/AHK/Storyline/ --strip-components=4'


# GitHub
# alias dotfiles='git remote set-url origin git@alok-github:alok-mishra/dotfiles.git'
alias dotfiles='git remote set-url origin git@github.com:alok-mishra/dotfiles.git'


##################################### GO #####################################
alias gor='go run'
