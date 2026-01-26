# Dotfiles Repository

## System Information
- **OS**: Arch Linux (fresh install as of Jan 2026)
- **Desktop Environments**:
  - Hyprland (primary, currently in use)
  - COSMIC (secondary)

## Current Focus
Configuring Hyprland on fresh Arch install and keeping dotfiles updated.

## Repository Structure
This is a shared dotfiles repository for Linux and WSL environments, managed with GNU Stow.

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
- `ghostty/` - Ghostty terminal configuration
- `hypr/` - Hyprland window manager configuration
  - `hyprland.conf` - Custom config (sources defaults)
  - `hyprland-defaults.conf` - Original Hyprland defaults (update separately)
- `waybar/` - Waybar status bar configuration
- `rofi/` - Rofi launcher configuration (gruvbox theme, vim keys)
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

## Configuration Notes
- Shell: ZSH with Starship prompt (fallback to Powerlevel10k on Windows)
- Terminal: ghostty, WezTerm
- Editor: Neovim (submodule), Zed
- Launcher: rofi (gruvbox theme, Papirus icons)
- Previous WM experience: i3, Sway (archived)
- Tools: NVS (Node), Go, zoxide

## System Dependencies
Packages that should be installed for full functionality:
- `papirus-icon-theme` - Icons for rofi
- `stow` - Dotfiles management

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

## Session Notes
Session notes are stored in `.agents/sessions/` with date-based filenames (YYYY-MM-DD-topic.md). Check the most recent file in this directory for context from previous conversations.

General note: When searching the repository, always ensure your search includes dot-prefixed (hidden) directories like `.agents/` to avoid missing important files.

## Notes for AI Agents
- When modifying configurations, respect the Stow structure (files in `home/` map to `~/`, files in `config/` map to `~/.config/`)
- The Neovim config is a submodule - changes should be made in the upstream repository
- Shell configurations are modular - check both `/shell/` and `/aliases/` directories
- Bootstrap scripts use GNU Stow with specific ignore patterns for `.bashrc` and `.bash_profile`
- Test configurations before committing
- Before making configuration changes to any component (e.g., Hyprland, Waybar, Zed, etc.), always fetch and read the latest official documentation for that component using the documentation links in the "Documentation Resources" section to ensure syntax and best practices are current.


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
- **Ghostty**: https://github.com/ghostty-org/ghostty
  - Documentation: https://ghostty.org/docs
- **Rofi**: https://github.com/davatorium/rofi
  - Documentation: https://github.com/davatorium/rofi/wiki
- **Starship**: https://github.com/starship/starship
  - Documentation: https://starship.rs/
- **Hyprland**: https://github.com/hyprwm/Hyprland
  - Documentation: https://wiki.hyprland.org/
- **Waybar**: https://github.com/Alexays/Waybar
  - Documentation: https://github.com/Alexays/Waybar/wiki
- **GNU Stow**: https://www.gnu.org/software/stow/
  - Manual: https://www.gnu.org/software/stow/manual/
