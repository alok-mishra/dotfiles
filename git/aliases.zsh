# Common
alias gi='git init'
alias gib='git init --bare'
alias gs='git status'
alias ga='git add'
alias gaa='git add --all'

# Remotes
alias gR='git remote'
alias gRv='git remote -v'

# Logs
alias glo='git log --oneline -10'
alias glog='git log --oneline --graph --all --decorate'


# Clone
alias gcl='git clone'
alias gcld1='git clone --depth 1'


# Branch / Checkout / Diff
alias gb='git branch'
alias gba='git branch -a'
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
alias cache='git rm -r --cached .'

# Reset
alias gwRm='git reset --mixed HEAD~1'
alias gwRs='git reset --soft HEAD~1'
alias gwRh='git reset --hard HEAD~1'


# Fetch / Merge / Pull / Rebase / Push
alias fetch='git fetch'
alias pull='git pull'
alias push='git push'
alias force='git push --force'

alias trackall='for remote in `git branch -r | grep -v "\->"`; do git branch --track ${remote#origin/} $remote; done;'
alias fetchall='git fetch --all'
alias pushall='git push --all'

alias gm='git merge'
alias gmm='git merge master'
alias gmt='git mergetool'

alias gp1='git pull --depth 1'

alias grm='git rebase origin/master'

# Commit
alias gco='git commit -m'
alias gca='git commit -am'
alias gcv='git commit --verbose --all'

# Tag
alias gt='git tag'
alias gta='git tag -a'
alias gt1='git tag -a 1.0 -m'


# Submodules
alias gS='git submodule'
alias gSa='git submodule add'
alias gSu='git submodule update --init --recursive'
alias gSr='git submodule foreach --recursive'
alias gSp='git pull --recurse-submodules'


# Repos
alias gcla='git clone --local $repo/Assembly.git'
alias gclar='git clone --recursive --local $repo/Assembly.git'
alias gclp='git clone $repo/Package.git'
alias gclpb='git clone $repo/Package.git -b'
alias gclm='git clone $repo/manifest.git'
alias gclv='git clone --local $repo/video.git'
alias gclas='git clone --local $repo/classes.git'
alias gclf='git clone --local $repo/fla.git'
alias gcln='git clone $repo/newdealer.git'


# Archive / Extract
alias gar='git archive HEAD --format=zip > "../${PWD##*/}.zip"'
alias gara='git archive --remote=$repo/Assembly.git master | tar -xv'
alias gars='git archive --remote=$repo/Assembly.git master | tar -xv shell/scripts/Storyline/ --strip-components=3'
alias garp='git archive --remote=$repo/Assembly.git master | tar -xv shell/scripts/Package/ --strip-components=3'


# GitHub
# alias dotfiles='git remote set-url origin git@alok-github:alok-mishra/dotfiles.git'
alias dotremote='git remote set-url origin git@github.com:alok-mishra/dotfiles.git'
alias dotfiles='git clone git@github.com:alok-mishra/dotfiles.git'
github_init() { curl -u "alok-mishra" https://api.github.com/user/repos -d "{'name':$1,'description':$2}"; }
alias ghi='github_init'
alias gclng2='git clone https://github.com/angular/quickstart.git'
