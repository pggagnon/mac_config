# install homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# install rosetta and xcode tools
xcode-select --install
sudo softwareupdate --install-rosetta


# get config files from github
example curl -L https://raw.githubusercontent.com/andrewconnell/osx-install/master/scripts/macos-install.zsh | zsh


copy over ssh keys then configure them
# set permission to make my keys private
sudo chmod 400 ~/.ssh/id_rsa

# configure 'config' folder permissions
sudo chmod 600 ~/.ssh/config

# add key to SSH agent
#     + enter passphrase from password manager when prompted
ssh-add ~/.ssh/id_rsa

# add to keychain
ssh-add -K


# configure macOS defaults
