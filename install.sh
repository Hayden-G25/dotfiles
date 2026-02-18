#!/bin/bash

# 1. Define paths
REPO_VIMRC="./.vimrc"
TARGET_VIMRC="$HOME/.vimrc"
VUNDLE_DIR="$HOME/.vim/bundle/Vundle.vim"

echo "Starting Vim environment setup..."

# 2. Copy .vimrc to Home Directory
if [ -f "$REPO_VIMRC" ]; then
    echo "Copying .vimrc to $HOME..."
    cp "$REPO_VIMRC" "$TARGET_VIMRC"
else
    echo "Error: .vimrc not found in the current repository folder."
    exit 1
fi

# 3. Install Vundle if it doesn't exist
if [ ! -d "$VUNDLE_DIR" ]; then
    echo "Vundle not found. Cloning Vundle..."
    git clone https://github.com/VundleVim/Vundle.vim.git "$VUNDLE_DIR"
else
    echo "Vundle is already installed."
fi

# 4. Install plugins via Vim
echo "Installing plugins defined in .vimrc..."
# We use +PluginInstall and +qall to run it headlessly
vim +PluginInstall +qall

echo "Setup complete!"