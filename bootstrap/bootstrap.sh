#!/bin/bash
# Bootstrap dotfiles with GNU Stow
#
# Usage: cd ~/.dotfiles && bash bootstrap/bootstrap.sh
# Requires: GNU Stow (install with: sudo pacman -S stow)

# Initialize git submodules (nvim config)
git submodule update --init --recursive

# Stow packages
stow -t ~ --ignore='.bashrc' --ignore='.bash_profile' home
stow -t ~/.config config
