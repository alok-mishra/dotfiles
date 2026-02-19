# Detect environment
is_wsl=$(uname -a | grep -i wsl)
is_rpi=$(uname -a | grep -i rpi)
is_wit=$(uname -a | grep -i wit)
is_arch=$([ -f /etc/os-release ] && grep "ID=arch" /etc/os-release)

#################### TOOL SETUP FUNCTIONS ####################

# NVS - Node Version Switcher
function setupNvs {
    if [[ -n "$WINDIR" ]]; then
        export NVS_HOME="$HOME/scoop/apps/nvs/current"
    else
        export NVS_HOME="$HOME/.nvs"
        export PATH="$PATH:$NVS_HOME/default/bin/node"
        export NODE_PATH="$NVS_HOME/default/lib/node_modules/"
    fi
    [ -s "$NVS_HOME/nvs.sh" ] && source "$NVS_HOME/nvs.sh" >>/dev/null
    return 0
}

# Go
function setupGo {
    if command -v go &> /dev/null; then
        export GOPATH="$HOME/go"
        export PATH="$PATH:$(go env GOBIN):$(go env GOPATH)/bin"
    fi
}

# Zoxide - smarter cd
function setupZoxide {
    if command -v zoxide &> /dev/null; then
        eval "$(zoxide init $(basename $SHELL))"
    fi
}
