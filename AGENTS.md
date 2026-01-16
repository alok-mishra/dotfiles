# Dotfiles Repository

## Overview
This is Alok's personal dotfiles repository, shared between Linux and WSL environments. It uses GNU Stow for symlink management to deploy configuration files across the system.

## Repository Structure

### `/bootstrap/`
Bootstrap scripts for setting up dotfiles on new systems:
- `bootstrap.sh` - Main bootstrap script using GNU Stow (Linux/WSL)
- `bootstrap-windows.sh` - Windows-specific bootstrap
- `bootstrap-manual.sh` - Manual setup alternative

### `/home/`
Home directory dotfiles that get stowed to `~/`:
- `.bashrc`, `.bash_profile` - Bash shell configuration
- `.zshrc`, `.p10k.zsh` - Zsh shell configuration with Powerlevel10k
- `.vimrc` - Vim configuration
- `.gitconfig`, `.gitignore_global` - Git configuration
- `.minttyrc` - MinTTY terminal configuration

### `/config/`
XDG config directory files that get stowed to `~/.config/`:
- `nvim/` - Neovim configuration (git submodule: alok-mishra/nvim)
- `zed/` - Zed editor configuration
- `Code/` - VSCode configuration
- `wezterm/` - WezTerm terminal configuration
- `hypr/` - Hyprland window manager configuration
- `waybar/` - Waybar status bar configuration
- `starship.toml` - Starship prompt configuration

### `/shell/`
Modular shell configuration files:
- `aliases.sh` - General shell aliases
- `env.sh` - Environment variables
- `functions.sh` - Shell functions

### `/aliases/`
Organized alias files by category:
- `.aliases` - General aliases
- `git.aliases` - Git-specific aliases
- `arch.aliases` - Arch Linux specific
- `pr.aliases` - Pull request helpers
- `work.aliases` - Work-related aliases

### `/archive/`
Historical/archived configurations

## Installation

1. Clone the repository: `git clone <repo-url> ~/.dotfiles`
2. Initialize submodules: `cd ~/.dotfiles && git submodule update --init --recursive`
3. Run bootstrap: `bash bootstrap/bootstrap.sh`
4. Requires GNU Stow: `sudo pacman -S stow` (Arch) or equivalent

## Key Technologies
- **GNU Stow**: Symlink farm manager for deploying dotfiles
- **Git Submodules**: Neovim configuration is managed as a separate repository
- **Multi-shell**: Supports both Bash and Zsh
- **Cross-platform**: Works on Linux and WSL environments

## Notes for AI Agents
- When modifying configurations, respect the Stow structure (files in `home/` map to `~/`, files in `config/` map to `~/.config/`)
- The Neovim config is a submodule - changes should be made in the upstream repository
- Shell configurations are modular - check both `/shell/` and `/aliases/` directories
- Bootstrap scripts use GNU Stow with specific ignore patterns for `.bashrc` and `.bash_profile`

## Documentation Resources
Where to find official documentation for tools used in this repository:

- **Zed Editor**: https://github.com/zed-industries/zed
  - Documentation: https://github.com/zed-industries/zed/tree/main/docs
  - WSL Support: https://github.com/zed-industries/zed/blob/main/docs/src/remote-development.md
  - Windows Guide: https://github.com/zed-industries/zed/blob/main/docs/src/windows.md
- **VS Code**: https://github.com/microsoft/vscode
  - Documentation: https://code.visualstudio.com/docs
- **Neovim**: https://github.com/neovim/neovim
  - Documentation: https://neovim.io/doc/
- **WezTerm**: https://github.com/wez/wezterm
  - Documentation: https://wezfurlong.org/wezterm/
- **Starship**: https://github.com/starship/starship
  - Documentation: https://starship.rs/
- **Hyprland**: https://github.com/hyprwm/Hyprland
  - Documentation: https://wiki.hyprland.org/
- **Waybar**: https://github.com/Alexays/Waybar
  - Documentation: https://github.com/Alexays/Waybar/wiki
- **GNU Stow**: https://www.gnu.org/software/stow/
  - Manual: https://www.gnu.org/software/stow/manual/
