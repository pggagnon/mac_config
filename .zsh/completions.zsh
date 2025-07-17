# completions

# The following lines have been added by Docker Desktop to enable Docker CLI completions.
FPATH="$HOME/.docker/completions:$FPATH"
autoload -Uz compinit
compinit
# End of Docker CLI completions

# To activate these completions, add the following to your .zshrc:
if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh-completions:$FPATH

  autoload -Uz compinit
  compinit
fi
