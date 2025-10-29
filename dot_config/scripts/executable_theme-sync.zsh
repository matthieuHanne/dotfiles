#!/usr/bin/env zsh
set -euo pipefail

export PATH="/opt/homebrew/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$PATH"

mode="light"
flavour="latte"

if defaults read -g AppleInterfaceStyle 2>/dev/null | grep -qi "Dark"; then
  mode="dark"
  flavour="macchiato"
fi

env_file="$HOME/.config/zsh/theme.env"
mkdir -p "${env_file:h}"

cat >"$env_file" <<ENV
export APP_THEME="${mode}"
export CATPPUCCIN_FLAVOUR="${flavour}"
export NVIM_BACKGROUND="${mode}"
ENV

if command -v tmux >/dev/null 2>&1; then
  if tmux list-sessions >/dev/null 2>&1; then
    tmux set-environment -g CATPPUCCIN_FLAVOUR "${flavour}" >/dev/null 2>&1 || true
    tmux set-environment -g APP_THEME "${mode}" >/dev/null 2>&1 || true
    tmux set-environment -g NVIM_BACKGROUND "${mode}" >/dev/null 2>&1 || true
    tmux set -g @catppuccin_flavour "${flavour}" >/dev/null 2>&1 || true
    tmux source-file "$HOME/.config/tmux/tmux.conf" >/dev/null 2>&1 || true
  fi
fi

exit 0
