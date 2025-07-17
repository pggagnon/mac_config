#!/usr/bin/env bash

# run updates
brew update

# check for outdated formula
brew outdated
brew upgrade

# check for outdated casks
brew cask outdated
brew cask upgrade

brew cleanup

# update mac app store apps
echo "running mac app store updates"
mas outdated
mas upgrade
