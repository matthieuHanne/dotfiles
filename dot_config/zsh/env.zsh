# ----------------------------------------
# Environment & Path
# ----------------------------------------
# Add ~/.local/bin and its subfolders to PATH
if [ -d "$HOME/.local/bin" ]; then
  LOCAL_PATHS=$(find "$HOME/.local/bin" -type d 2>/dev/null | paste -sd ':' -)
  export PATH="$LOCAL_PATHS:$PATH"
fi

export EDITOR="nvim"
export TERMINAL="ghostty"
export BROWSER="google-chrome"

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

# NMP
export NPM_CONFIG_PREFIX="$XDG_DATA_HOME/npm"
export NPM_CONFIG_USERCONFIG="$XDG_CONFIG_HOME/npm/config"
export NPM_CONFIG_CACHE="$XDG_CACHE_HOME/npm"
export NPM_CONFIG_TMP="$XDG_DATA_HOME/npm"
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

# Create required cache directories
mkdir -p \
  "$(dirname "$ZSH_COMPDUMP")" \
  "$(dirname "$_Z_DATA")" \
  "$(dirname "$HISTFILE")" \
  "$GOMODCACHE" \
  "$PNPM_HOME" \
  "$NPM_CONFIG_CACHE" \
  "$ZSH_SESSION_DIR" \
  "$TMUX_TMPDIR" \
  "$TMUX_RESURRECT_DIR"

# History
HISTSIZE=10000000
SAVEHIST=10000000
