#!/usr/bin/env bash

# set the permissions for this directory so that we can execute the scripts
# chmod -R u+x mac_config

# remove the DS_Store file from git
# git rm --cached .DS_Store

# install rosetta
softwareupdate --install-rosetta --agree-to-license

# install brew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

brew update
brew upgrade
brew doctor

compaudit | xargs chmod g-w

brew install wget

# wget --no-parent -r 