#!/bin/bash
# Bootstrap dotfiles with GNU Stow
#
# Usage: cd ~/.dotfiles && bash scripts/bootstrap.sh
# Requires: GNU Stow (install with: sudo pacman -S stow)

# Detect environment
is_wsl=$(uname -a | grep -i wsl)

# Stow packages
stow -t ~ home
stow -t ~/.config config

# Linux desktop (skip on WSL)
[[ ! $is_wsl ]] && stow -t ~/.config config-linux
