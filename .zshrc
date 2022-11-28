# Path to your oh-my-zsh installation.
export ZSH=/Users/matthieu/.oh-my-zsh
export PATH=/usr/local/bin:/usr/local/sbin:$PATH

# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="ys"
HYPHEN_INSENSITIVE="true"
ENABLE_CORRECTION="true"
COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
plugins=(fzf git z zsh-completions zsh-syntax-highlighting magic-enter)

source $ZSH/oh-my-zsh.sh

# Aliases
alias zshconfig="mate ~/.zshrc"
alias ohmyzsh="mate ~/.oh-my-zsh"
alias dkup="docker-compose up"

unalias grbm;

grbm() {
  local current_branch=$(git symbolic-ref --short HEAD) 
  git checkout master
  git pull
  git checkout $current_branch
  git rebase master
}

grbh() {
  local count=$(git rev-list --count --no-merges master..) 
  git rebase -i HEAD~"$count"

}

ctrlp() {
  </dev/tty vim -c CtrlP
}
zle -N ctrlp
bindkey "^p" ctrlp



