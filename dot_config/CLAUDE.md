# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

This is a personal dotfiles configuration directory (`~/.config`) containing configurations for various development tools and applications. The configurations appear to be managed with chezmoi (based on the presence of chezmoi state file).

## Key Applications Configured

- **Neovim** (`nvim/`) - Lua-based configuration with lazy.nvim plugin manager
- **Tmux** (`tmux/tmux.conf`) - Terminal multiplexer with vim-tmux-navigator integration
- **Zsh** (`zsh/`) - Shell configuration split into modular files
- **Ghostty** (`ghostty/config`) - Terminal emulator configuration
- **Git** (`git/`) - Global git configuration
- **Docker** (`docker/`) - Docker CLI and buildx configuration
- **Various other tools**: npm, pnpm, lazygit, htop

## Neovim Configuration Structure

The Neovim configuration follows a modular structure:
- `init.lua` - Entry point that loads other modules
- `lua/config/` - Core configuration files (options, keymaps, lazy.lua, filetypes)
- `lua/plugins/` - Individual plugin configurations
- Uses lazy.nvim for plugin management with automatic plugin loading from the plugins directory

## Working with Configurations

When modifying configurations:
1. Respect the existing modular structure
2. For Neovim plugins, create separate files in `lua/plugins/`
3. Maintain consistency with the Catppuccin Mocha theme used across applications
4. Be aware of vim-tmux-navigator integration when modifying navigation keybindings

## Important Notes

- This appears to be a macOS system (Darwin platform)
- XDG Base Directory specification is being followed
- Many configurations use environment variables like `$XDG_DATA_HOME`, `$XDG_CACHE_HOME`
- The configurations show a preference for vim-style keybindings across applications