#!/bin/bash
# Linux Dotfiles Bootstrap - Manual symlinks (no stow required)
# Note: Use scripts/bootstrap.sh for Stow-based setup instead

ln -s ~/sync/dotfiles ~/.dotfiles
ln -s ~/sync/keys/.ssh ~/.ssh

# Shell configs from home/
ln -s ~/.dotfiles/home/.zshrc ~/.zshrc
ln -s ~/.dotfiles/home/.bashrc ~/.bashrc
ln -s ~/.dotfiles/home/.bash_profile ~/.bash_profile

# Git config from home/
ln -s ~/.dotfiles/home/.gitconfig ~/.gitconfig
ln -s ~/.dotfiles/home/.gitignore_global ~/.gitignore_global

# App configs from config/
ln -s ~/.dotfiles/config/wezterm ~/.config/wezterm
ln -s ~/.dotfiles/config/nvim ~/.config/nvim
ln -s ~/.dotfiles/config/starship.toml ~/.config/starship.toml
