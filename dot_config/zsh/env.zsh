# ----------------------------------------
# Environment & Path
# ----------------------------------------
eval "$(/opt/homebrew/bin/brew shellenv)"

if [ -d "$HOME/.local/bin" ]; then
  export PATH="$HOME/.local/bin:$PATH"
fi

export EDITOR="nvim"
export TERMINAL="ghostty"
export BROWSER="google-chrome"

# Theme synchronization with macOS appearance
_theme_env="$XDG_CONFIG_HOME/zsh/theme.env"
_theme_sync_script="$XDG_CONFIG_HOME/scripts/theme-sync.zsh"

if [ -z "${APP_THEME:-}" ] && [ -x "$_theme_sync_script" ] && [ ! -f "$_theme_env" ]; then
  "$_theme_sync_script" >/dev/null 2>&1 || true
fi

if [ -f "$_theme_env" ]; then
  source "$_theme_env"
fi

export APP_THEME="${APP_THEME:-dark}"
export CATPPUCCIN_FLAVOUR="${CATPPUCCIN_FLAVOUR:-mocha}"
export NVIM_BACKGROUND="${NVIM_BACKGROUND:-dark}"

# ----------------------------------------
# 📦 XDG Base Directory Setup
# ----------------------------------------

export XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-$HOME/.config}"
export XDG_DATA_HOME="${XDG_DATA_HOME:-$HOME/.local/share}"
export XDG_CACHE_HOME="${XDG_CACHE_HOME:-$HOME/.cache}"

# ZSH
export ZDOTDIR="$XDG_CONFIG_HOME/zsh"
export ZSH_COMPDUMP="$XDG_CACHE_HOME/zsh/.zcompdump"
export _Z_DATA="$XDG_CACHE_HOME/zsh/.z"
export ZSH_SESSION_DIR="$XDG_CACHE_HOME/zsh/sessions"
export HISTFILE="$XDG_CACHE_HOME/zsh/history"

# Oh My Zsh
export ZSH="$XDG_DATA_HOME/oh-my-zsh"
export ZSH_CUSTOM="$ZSH/custom"

# NPM
export NPM_CONFIG_PREFIX="$XDG_DATA_HOME/npm"
export NPM_CONFIG_USERCONFIG="$XDG_CONFIG_HOME/npm/config"
export NPM_CONFIG_CACHE="$XDG_CACHE_HOME/npm"
export PATH="$XDG_DATA_HOME/npm/bin:$PATH"

#PNPM
export PNPM_CONFIG_USERCONFIG="$XDG_CONFIG_HOME/pnpm/config.yaml"
export PNPM_HOME="$XDG_DATA_HOME/pnpm"
export PATH="$PNPM_HOME:$PATH"              # Add pnpm global bin

#GO
export GOPATH="$XDG_DATA_HOME/go"
export GOMODCACHE="$XDG_CACHE_HOME/go/mod"

# TMUX
export TMUX_PLUGIN_DIR="$XDG_DATA_HOME/tmux/plugins"
export TMUX_TMPDIR="$XDG_CACHE_HOME/tmux" 
export TMUX_RESURRECT_DIR="$XDG_CACHE_HOME/tmux/resurrect"

# Docker-specific directories
export DOCKER_CONFIG="$XDG_CONFIG_HOME/docker"
export DOCKER_DATA="$XDG_DATA_HOME/docker"
export DOCKER_CACHE="$XDG_CACHE_HOME/docker"

# Homebrew
export HOMEBREW_NO_ENV_HINTS=1              # Disable environment hints
export HOMEBREW_NO_ANALYTICS=1              # Disable analytics for privacy
export HOMEBREW_CLEANUP_MAX_AGE_DAYS=30     # Clean up old downloads after 30 days

# Create required cache directories (only if they don't exist)
for dir in \
  "$(dirname "$ZSH_COMPDUMP")" \
  "$(dirname "$_Z_DATA")" \
  "$(dirname "$HISTFILE")" \
  "$GOMODCACHE" \
  "$PNPM_HOME" \
  "$NPM_CONFIG_CACHE" \
  "$ZSH_SESSION_DIR" \
  "$TMUX_TMPDIR" \
  "$TMUX_RESURRECT_DIR" \
  "$DOCKER_DATA" \
  "$DOCKER_CACHE"; do
  [ ! -d "$dir" ] && mkdir -p "$dir"
done

# History
HISTSIZE=10000000
SAVEHIST=10000000
