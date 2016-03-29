#!/bin/bash
cd "$(dirname "${BASH_SOURCE}")";

function doIt() {
  rsync --exclude ".git/" --exclude ".DS_Store" --exclude "bootstrap.sh" \
    --exclude "README.md" -avh --no-perms . ~;
}

if [ "$1" == "--force" -o "$1" == "-f" ]; then
  doIt;
else
  read -p "Brew installs? (y/n) " -n 1;
  echo "";
  if [[ $REPLY =~ ^[Yy]$ ]]; then
    brew update
    brew upgrade --all
    brew install vim --override-system-vi
    brew install ack
    brew install tree 
    brew tap bramstein/webfonttools
    brew install sfnt2woff
    brew install sfnt2woff-zopfli
    brew install woff2
    brew cleanup
  fi;

  read -p "This may overwrite existing files in your home directory. Are you sure? (y/n) " -n 1;
  echo "";
  if [[ $REPLY =~ ^[Yy]$ ]]; then
    doIt;
  fi;
fi;
unset doIt;