#!/bin/bash
# Windows Bootstrap - Create symlinks for dotfiles
# Run from Git Bash (Windows side) with Admin privileges
# Must be run from the dotfiles directory: cd ~/.dotfiles && bash bootstrap/bootstrap-windows.sh [username]
#
# Usage:
#   bootstrap-windows.sh <username>  - Specify the target username
#
# Example:
#   bootstrap-windows.sh alok

echo "=== Windows Dotfiles Bootstrap ==="

# Get username from command line argument (required)
username="$1"

# Validate username is not empty
if [ -z "$username" ]; then
    echo "ERROR: Username is required!"
    echo ""
    echo "Usage:"
    echo "  bash bootstrap/bootstrap-windows.sh <username>"
    echo ""
    echo "Example:"
    echo "  bash bootstrap/bootstrap-windows.sh alok"
    exit 1
fi

home_dir="C:\\Users\\$username"

echo "User: $username"
echo "Home: $home_dir"
echo ""

# Function to create file symlink (removes existing symlink first)
link_file() {
    local name="${1##*\\}"  # Extract filename from path
    echo -n "  $name: "
    cmd <<< "dir \"$1\" | findstr \"<SYMLINK>\" >nul && del \"$1\" & mklink \"$1\" \"$2\"" 2>&1 | grep -v "Microsoft\|Copyright\|(c)\|^$" | grep "symbolic link created\|Cannot create"
}

# Function to create directory symlink (removes existing symlink, warns about real dirs)
link_dir() {
    local name="${1##*\\}"  # Extract directory name from path
    local parent="${1%\\*}"  # Extract parent directory path
    echo -n "  $name: "
    cmd <<< "(dir \"$parent\" 2>nul | findstr \"<SYMLINKD>.*$name\" >nul && rmdir \"$1\") & mklink /D \"$1\" \"$2\"" 2>&1 | grep -v "Microsoft\|Copyright\|(c)\|^$" | grep "symbolic link created\|Cannot create"
}

# USERPROFILE symlinks
symlinks=(".zshrc" ".bashrc" ".bash_profile" ".p10k.zsh" ".minttyrc" ".gitconfig" ".gitignore_global" ".vimrc")

echo ""
echo "Creating USERPROFILE symlinks..."
for file in "${symlinks[@]}"; do
    link_file "$home_dir\\$file" "%CD%\\home\\$file"
done

echo ""
echo "Creating .config directory symlinks..."
link_dir "$home_dir\\.config\\wezterm" "%CD%\\config\\wezterm"
link_dir "$home_dir\\.config\\nvim" "%CD%\\config\\nvim"

echo ""
echo "Creating Zed symlinks..."
link_file "$home_dir\\AppData\\Roaming\\Zed\\settings.json" "%CD%\\config\\zed\\settings.json"
link_file "$home_dir\\AppData\\Roaming\\Zed\\keymap.json" "%CD%\\config\\zed\\keymap.json"

echo ""
echo "Creating VS Code Insiders (Scoop persist) symlinks..."
link_file "$home_dir\\scoop\\persist\\vscode-insiders\\data\\user-data\\User\\settings.json" "%CD%\\config\\Code\\User\\settings.json"
link_file "$home_dir\\scoop\\persist\\vscode-insiders\\data\\user-data\\User\\keybindings.json" "%CD%\\config\\Code\\User\\keybindings.json"

echo "=== Done! ==="
