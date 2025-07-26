#!/usr/bin/env bash

# set the permissions for this directory so that we can execute the scripts
# chmod -R u+x mac_config

# remove the DS_Store file from git
# git rm --cached .DS_Store

# install rosetta
softwareupdate --install-rosetta --agree-to-license

# install brew
bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

brew update
brew upgrade
brew doctor

compaudit | xargs chmod g-w

cp .zsh ~/.zsh

if [ ! -f ~/.zshrc ]; then
  echo "Creating .zshrc file"
  cat >> ~/.zshrc << EOF
    export PATH=/bin:/usr/bin:/usr/local/bin:/sbin:${PATH}
    export PATH="${ASDF_DATA_DIR:-$HOME/.asdf}/shims:$PATH"

    autoload -Uz compinit && compinit
    autoload -U +X bashcompinit && bashcompinit

    complete -o nospace -C /opt/homebrew/bin/terraform terraform

    eval "$(starship init zsh)"

    . "$HOME/.local/bin/env"

    [[ -f ~/.zsh/completions.zsh ]] && source ~/.zsh/completions.zsh
EOF
  echo ".zshrc file created with necessary lines."
else
  echo ".zshrc file already exists, ensure it contains the necessary lines."
fi

# restart zsh after changes
exec /bin/zsh

# run all installs
echo "running run_all.sh"
bash ./run_all.sh
echo "running update.sh"
bash ./update.sh