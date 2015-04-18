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


# Branch / Checkout / Diff
alias gb='git branch -a'
alias gbm='git branch --merged'

alias gch='git checkout'
alias gchb='git checkout -b'
alias gchm='git checkout master'

alias gd='git diff'
alias gdn='git diff --name-only'
alias gdm='git diff master'

alias gdt='git difftool'

alias stash='git stash'
alias pop='git stash pop'
alias reset='git reset --soft HEAD~1'


# Fetch / Merge / Pull
alias gf='git fetch'

alias gm='git merge'
alias gmm='git merge master'
alias gmt='git mergetool'

alias gp='git pull'
alias gp1='git pull --depth 1'

alias gP='git push'


# Commit
alias gco='git commit -m'
alias gca='git commit -am'
alias gcv='git commit --verbose --all'


# Submodules
alias gsa='git submodule add -b master'
alias gsu='git submodule update'
alias gsr='git submodule foreach --recursive'
alias gps='git pull --recurse-submodules'


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

