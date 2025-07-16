# Key steps to complete

## SSH keys
if we're creating new keys follow the guide:
https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent

if we're using old keys then copy over ssh keys and configure them:
set permission to make my keys private
`sudo chmod 400 ~/.ssh/id_ed25519`

configure 'config' and then apply folder permissions
`touch ~/.ssh/config`

>Host github.com
>  AddKeysToAgent yes
>  UseKeychain yes
>  IdentityFile ~/.ssh/id_ed25519

`sudo chmod 600 ~/.ssh/config`

add key to SSH agent
`ssh-add ~/.ssh/id_ed25519`

add key to github
https://docs.github.com/en/authentication/connecting-to-github-with-ssh/adding-a-new-ssh-key-to-your-github-account

test that the key works
https://docs.github.com/en/authentication/connecting-to-github-with-ssh/testing-your-ssh-connection

`ssh -T git@github.com`

> The authenticity of host 'github.com (IP ADDRESS)' can't be established.
> ED25519 key fingerprint is SHA256:+DiY3wvvV6TuJJhbpZisF/zLDA0zPMSvHdkr4UvCOqU.
> Are you sure you want to continue connecting (yes/no)?

> Hi USERNAME! You've successfully authenticated, but GitHub does not
> provide shell access.

## Get the repo from github
`git clone git@github.com:pggagnon/mac_config.git`

`cd [location of repo]`

## manually run init.sh

## input the registration keys for istat-menus 5 and daisydisk once they've been installed