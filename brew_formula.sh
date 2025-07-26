#!/usr/bin/env bash

brew install prettyping
brew install tailscale
brew install asdf
brew install autoconf
brew install git
brew install gmp
brew install dropbox
brew install htop
brew install imagemagick
brew install imessage-exporter
brew install libyaml
brew install mailsy
brew install mas
brew install mpv
brew install openssl@3
brew install readline
brew install starship
brew install terraform
brew install uv
brew install yt-dlp
brew install hashicorp/tap/terraform
brew install starship

# Install borders with config
brew tap FelixKratz/formulae
brew install borders
if [ ! -f ~/.config/borders/bordersrc ]; then
    cat >> ~/.config/borders/bordersrc<< EOF
    #!/bin/bash

    options=(
        style=round
        width=6.0
        hidpi=on
        active_color=0xffe2e2e3
        inactive_color=0xff414550
    )

    borders "${options[@]}"
EOF
    echo "Borders configuration file created at ~/.config/borders/bordersrc"
else
    echo "Borders configuration file already exists at ~/.config/borders/bordersrc"
fi

brew services start borders
