# prompt.zsh - YS-inspired minimal prompt for Zsh

autoload -U colors && colors

# VCS prompt colors and symbols
YS_VCS_PREFIX1="%{$reset_color%}on%{$fg[blue]%} "
YS_VCS_PREFIX2=":%{$fg[cyan]%}"
YS_VCS_SUFFIX="%{$reset_color%}"
YS_VCS_DIRTY=" %{$fg[red]%}x"
YS_VCS_CLEAN=" %{$fg[green]%}o"

# Git prompt info (using zsh's built-in vcs_info or fallback)
git_prompt_info() {
  if command -v git &>/dev/null && git rev-parse --is-inside-work-tree &>/dev/null; then
    local branch=$(git symbolic-ref --short HEAD 2>/dev/null || git rev-parse --short HEAD 2>/dev/null)
    local dirty=""
    if [[ -n $(git status --porcelain 2>/dev/null) ]]; then
      dirty=$YS_VCS_DIRTY
    else
      dirty=$YS_VCS_CLEAN
    fi
    echo -n "${YS_VCS_PREFIX1}git${YS_VCS_PREFIX2}${branch}${dirty}${YS_VCS_SUFFIX}"
  fi
}

# SVN prompt info (simple)
svn_prompt_info() {
  if command -v svn &>/dev/null && svn info &>/dev/null; then
    local branch=$(svn info | awk '/URL:/ {print $2}' | sed 's!.*/!!')
    local status=$(svn status)
    local dirty=$([[ -n $status ]] && echo "$YS_VCS_DIRTY" || echo "$YS_VCS_CLEAN")
    echo -n "${YS_VCS_PREFIX1}svn${YS_VCS_PREFIX2}${branch}${dirty}${YS_VCS_SUFFIX}"
  fi
}

# Mercurial prompt info
hg_prompt_info() {
  if command -v hg &>/dev/null && [ -d ".hg" ]; then
    local branch=$(hg branch 2>/dev/null)
    local dirty=""
    if [[ -n $(hg status 2>/dev/null) ]]; then
      dirty=$YS_VCS_DIRTY
    else
      dirty=$YS_VCS_CLEAN
    fi
    echo -n "${YS_VCS_PREFIX1}hg${YS_VCS_PREFIX2}${branch}${dirty}${YS_VCS_SUFFIX}"
  fi
}

# Virtualenv prompt info
virtenv_prompt() {
  [[ -n "${VIRTUAL_ENV:-}" ]] || return
  echo -n "%{$fg[green]%}${${VIRTUAL_ENV:t}} %{$reset_color%}"
}

# Exit code prompt
exit_code_prompt() {
  [[ $? -eq 0 ]] && echo "" || echo "%(?,,C:%{$fg[red]%}%?%{$reset_color%})"
}

# Compose the prompt
setopt PROMPT_SUBST
PROMPT='
%{$terminfo[bold]$fg[blue]%}#%{$reset_color%} \
%{$fg[yellow]%}%~%{$reset_color%} \
$(git_prompt_info)$(svn_prompt_info)$(hg_prompt_info)$(virtenv_prompt) \
[%*] $(exit_code_prompt)
%{$terminfo[bold]$fg[red]%}$ %{$reset_color%}'
