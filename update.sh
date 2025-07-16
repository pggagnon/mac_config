#!/bin/sh 

# run updates

brew update

# run all formula
sh ./brew_formula.sh
# check for outdated formula
brew outdated
brew upgrade

# run all casks
sh ./brew_casks.sh

# check for outdated casks
brew cask outdated
brew cask upgrade

brew cleanup

# run all mac defaults
sh ./defaults.sh

# update mac app store apps
mas outdated
mas upgrade

