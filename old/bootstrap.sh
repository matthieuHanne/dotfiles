#!/bin/bash
cd "$(dirname "${BASH_SOURCE}")";

function doIt() {
  rsync --exclude ".git/" --exclude ".DS_Store" --exclude "bootstrap.sh" \
    --exclude "README.md" -avh --no-perms . ~;
  git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/vundle
  vim +PluginInstall +qall!
}

if [ "$1" == "--force" -o "$1" == "-f" ]; then
  doIt;
else
  read -p "Brew installs? (y/n) " -n 1;
  echo "";
  if [[ $REPLY =~ ^[Yy]$ ]]; then
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    brew update
    brew upgrade --all
    brew install zsh zsh-completions
    curl -L https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh | sh
    chsh -s /bin/zsh
    brew install vim --with-override-system-vi
    brew install ack
    brew install npm
    brew install tree
    brew tap bramstein/webfonttools
    brew install sfnt2woff
    brew install sfnt2woff-zopfli
    brew install woff2
    brew cleanup
    npm install -g bower
    npm install -g handlebars
    npm install -g jshint
    npm install -g ember-cli
  fi;

  read -p "This may overwrite existing files in your home directory. Are you sure? (y/n) " -n 1;
  echo "";
  if [[ $REPLY =~ ^[Yy]$ ]]; then
    doIt;
  fi;
fi;
unset doIt;
