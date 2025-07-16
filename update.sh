#!/usr/bin/env bash

# run updates

brew update

# run all formula
echo "running brew_formula"
sh ./brew_formula.sh
# check for outdated formula
brew outdated
brew upgrade

# run all casks
echo "running brew_casks"
sh ./brew_casks.sh

# check for outdated casks
brew cask outdated
brew cask upgrade

brew cleanup

# run all mac defaults
echo "running mac defaults"
sh ./defaults.sh

# update mac app store apps
echo "running mac app store updates"
mas outdated
mas upgrade

