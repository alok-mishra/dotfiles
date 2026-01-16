#!/bin/bash
# Bootstrap dotfiles with GNU Stow
#
# Usage: cd ~/.dotfiles && bash bootstrap/bootstrap.sh
# Requires: GNU Stow (sudo pacman -S stow)

# Initialize git submodules (nvim config)
git submodule update --init --recursive --verbose

stow --verbose=2 --ignore='.bashrc' --ignore='.bash_profile' -t ~ home
stow --verbose=2 -t ~/.config config
