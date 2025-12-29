# Load modular configs
if [ -d ~/.dotfiles/bashrc.d ]; then
  for file in ~/.dotfiles/zshrc.d/*.sh; do
    source "$file"
  done
fi

# Initialize Conda for Zsh (Run this once in terminal if it's missing)
# conda init zsh