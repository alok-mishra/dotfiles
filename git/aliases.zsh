# Common
alias gi='git init'
alias gib='git init --bare'
alias gs='git status'
alias ga='git add'
alias gaa='git add --all'

# Remotes
alias gr='git remote -v'

# Logs
alias glo='git log --oneline -10'
alias glog='glo --graph --all --decorate'


# Clone
alias gcl='git clone'
alias gcld1='git clone --depth 1'


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
