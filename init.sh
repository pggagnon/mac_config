#!/bin/sh

# install brew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

brew update
brew upgrade
brew doctor

compaudit | xargs chmod g-w

brew install wget

# wget --no-parent -r 