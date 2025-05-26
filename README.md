# 🛠️ m2thn dotfiles

This repository contains my personal dotfiles, managed with chezmoi, to set up a consistent development environment across machines. It adheres to the XDG Base Directory Specification for organizing configuration, data, and cache files.

## 📁 Repository Structure

dot_config/ – Configuration files placed under $XDG_CONFIG_HOME
dot_zprofile – Shell profile settings for login shells
dot_vimrc – Vim configuration
run_once_install-darwin.sh.tmpl – One-time setup script for macOS
.chezmoignore – Files and directories to exclude from chezmoi management
.gitignore – Git ignore rules

🚀 Installation

## 🛠️ Prerequisites (macOS)

Before applying your dotfiles using [chezmoi](https://www.chezmoi.io/), you'll need to install a few essential tools:

```sh
# 1. Install Xcode Command Line Tools
xcode-select --install

# 2. Install Homebrew (macOS package manager)
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# 3. Install chezmoi (dotfiles manager)
brew install chezmoi

# 4. Initialize your dotfiles from this repo
chezmoi init https://github.com/matthieuHanne/dotfiles.git

# 5. Apply your dotfiles
chezmoi apply

## 🧰 Features
- XDG Compliance: Organizes configuration ($XDG_CONFIG_HOME), data ($XDG_DATA_HOME), and cache ($XDG_CACHE_HOME) files according to the XDG specification.
- Shell Configuration: Customizes Zsh environment via dot_zprofile -> $XDG_CONFIG_HOME/zsh.
- nVim Setup: Personalized nVim settings and basic vimrc for fallback.
- macOS Support: Includes a one-time setup script tailored for macOS systems.

📝 Customization
Feel free to fork this repository and modify the configurations to suit your preferences. The use of chezmoi makes it straightforward to manage and apply changes across multiple machines.
