# Dotfiles

Alok's personal dotfiles for Linux and WSL environments. Uses GNU Stow for symlink management and modular configuration organization.

## 🚀 Quick Start

```bash
# Clone the repository
git clone <repo-url> ~/.dotfiles
cd ~/.dotfiles

# Initialize git submodules (for Neovim config)
git submodule update --init --recursive

# Deploy dotfiles with GNU Stow
bash bootstrap/bootstrap.sh
```

## 📁 Structure

- **`/home/`** - Home directory dotfiles (stowed to `~/`)
  - Shell configs: `.bashrc`, `.zshrc`, `.bash_profile`
  - Editor configs: `.vimrc`
  - Git configs: `.gitconfig`, `.gitignore_global`
  - Powerlevel10k: `.p10k.zsh`

- **`/config/`** - XDG config directory (stowed to `~/.config/`)
  - Editors: `nvim/`, `zed/`, `Code/`
  - Terminal: `wezterm/`
  - Desktop: `hypr/`, `waybar/`
  - Prompt: `starship.toml`

- **`/shell/`** - Modular shell configuration
  - `aliases.sh` - General aliases
  - `env.sh` - Environment variables
  - `functions.sh` - Shell functions

- **`/aliases/`** - Organized aliases by category
  - `.aliases` - General
  - `git.aliases` - Git operations
  - `arch.aliases` - Arch Linux specific
  - `pr.aliases` - Pull request helpers
  - `work.aliases` - Work-related

- **`/bootstrap/`** - Setup scripts
  - `bootstrap.sh` - Main bootstrap (Linux/WSL)
  - `bootstrap-windows.sh` - Windows setup
  - `bootstrap-manual.sh` - Manual alternative

## 🛠️ Requirements

- **GNU Stow**: `sudo pacman -S stow` (Arch) or equivalent
- **Git**: For cloning and submodule management
- **Zsh** (optional): For zsh-specific configurations
- **Bash**: For bash-specific configurations

## 💻 Environments

Tested and working on:
- **Arch Linux**
- **WSL2** (Windows Subsystem for Linux)

## 📝 Usage

### Adding New Dotfiles

1. Place file in appropriate directory (`home/` or `config/`)
2. Re-run `stow` command from bootstrap script

### Updating Neovim Config

The Neovim configuration is a git submodule:

```bash
cd config/nvim
git pull origin main
cd ../..
git add config/nvim
git commit -m "Update nvim config"
```

## 🔗 Related

- Neovim Config: [alok-mishra/nvim](https://github.com/alok-mishra/nvim)

## 📚 Documentation

For detailed information about the repository structure and configuration, see [AGENTS.md](./AGENTS.md).

## 📄 License

See [LICENSE](./LICENSE) file.
