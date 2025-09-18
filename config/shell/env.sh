# Shared environment variables and setup

# NVM Setup
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# NVS Setup
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
setupNvs