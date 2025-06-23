#!/bin/sh
# ----------------------------------------
# Custom Aliases (overriding Oh My Zsh defaults where needed)
# ----------------------------------------

# Use neovim for vim if present.
[ -x "$(command -v nvim)" ] && alias vim="nvim" vimdiff="nvim -d"

# sudo not required for some system commands
for command in mount umount sv pacman updatedb su shutdown poweroff reboot; do
  alias $command="sudo $command"
done
unset command

# Custom functions
se() {
  choice="$(find ~/.local/bin -mindepth 1 -printf '%P\n' | fzf)"
  [ -f "$HOME/.local/bin/$choice" ] && $EDITOR "$HOME/.local/bin/$choice"
}

# Verbosity and settings that you pretty much just always are going to want.
alias \
  cp="cp -iv" \
  mv="mv -iv" \
  rm="rm -vI" \
  bc="bc -ql" \
  mkd="mkdir -pv"

# Colorize commands when possible (overriding Oh My Zsh defaults)
alias \
  l="ls -lh --color=auto" \
  grep="grep --color=auto" \
  diff="diff --color=auto" \
  ccat="highlight --out-format=ansi" \
  ip="ip -color=auto"

# These common commands are just too long! Abbreviate them.
alias \
  g="git" \
  e='$EDITOR' \
  v='$EDITOR'

# Git helper function
git_main_branch() {
  git rev-parse --abbrev-ref origin/HEAD | sed 's@^origin/@@'
}

# Custom git aliases (in addition to Oh My Zsh git plugin)
alias \
  gcm='git commit -m' \
  gco='git checkout' \
  gst='git status' \
  gpull='git pull' \
  gpush='git push'

# Docker aliases (supplement Oh My Zsh docker plugin)
alias \
  dps='docker ps' \
  dpsa='docker ps -a' \
  dimg='docker images' \
  drm='docker rm' \
  drmi='docker rmi'

# Quick directory navigation
alias \
  ..='cd ..' \
  ...='cd ../..' \
  ....='cd ../../..' \
  .....='cd ../../../..'

# System shortcuts
alias \
  reload='source ~/.config/zsh/.zshrc' \
  zshconfig='$EDITOR ~/.config/zsh' \
  nvimconfig='$EDITOR ~/.config/nvim'

# Python
alias \
  py='python3' \
  pip='pip3'

# Node/npm shortcuts
alias \
  ni='npm install' \
  nid='npm install --save-dev' \
  nr='npm run' \
  nrs='npm run start' \
  nrt='npm run test' \
  nrb='npm run build'

# Utility aliases
alias \
  h='history' \
  j='jobs -l' \
  path='echo -e ${PATH//:/\\n}' \
  now='date +"%T"' \
  nowdate='date +"%Y-%m-%d"' \
  week='date +%V'

# Safety nets
alias \
  ln='ln -i' \
  chown='chown --preserve-root' \
  chmod='chmod --preserve-root' \
  chgrp='chgrp --preserve-root'

# macOS specific
if [[ "$OSTYPE" == "darwin"* ]]; then
  alias flush='dscacheutil -flushcache'
  alias afk='/System/Library/CoreServices/Menu\ Extras/User.menu/Contents/Resources/CGSession -suspend'
  alias cleanup="find . -type f -name '*.DS_Store' -ls -delete"
  alias emptytrash="sudo rm -rfv /Volumes/*/.Trashes; sudo rm -rfv ~/.Trash; sudo rm -rfv /private/var/log/asl/*.asl"
fi