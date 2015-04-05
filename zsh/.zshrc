# Start Antigen
source ~/.antigen/antigen.zsh

# Load the oh-my-zsh's library.
antigen use oh-my-zsh

# Bundles from the default repo (robbyrussell's oh-my-zsh).
antigen bundle git
#antigen bundle heroku
#antigen bundle pip
#antigen bundle lein
#antigen bundle command-not-found

antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-history-substring-search

# Auto suggestions like fish
antigen bundle tarruda/zsh-autosuggestions

zle-line-init() {
zle autosuggest-start
}
zle -N zle-line-init

# Accept suggestions without leaving insert mode
#bindkey '^f' vi-forward-word
# or
bindkey '^l' vi-forward-blank-word
bindkey '^h' vi-backward-blank-word

accept-suggestion() {
    vi-end-of-line
    accept-line
}
#bindkey '^z' accept-suggestion()

# Load the theme.
antigen theme bira

# Tell antigen that you're done.
antigen apply
