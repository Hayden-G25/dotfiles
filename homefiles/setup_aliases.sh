#!/bin/bash

# 1. Check if the script is being ran as root (sudo)
if [ "$EUID" -ne 0 ]; then 
  echo "Please run this script with sudo."
  exit 1
fi

# Define user variables
REAL_USER=$SUDO_USER
USER_HOME=$(eval echo "~$REAL_USER")
DOTFILES_DIR="$USER_HOME/dotfiles"
ALIAS_FILE="$USER_HOME/.bash_aliases"

# 2. Update and Install Dependencies
echo "Updating and installing packages..."
apt update -y && apt install -y curl git htop

# 3. Handle the Dotfiles Directory
if [ ! -d "$DOTFILES_DIR" ]; then
    echo "Creating dotfiles repository directory..."
    mkdir -p "$DOTFILES_DIR"
fi

# 4. Move or Create the .bash_aliases in the dotfiles folder
# If the file exists in home, move it to dotfiles. If not, create a new one.
if [ -f "$ALIAS_FILE" ] && [ ! -L "$ALIAS_FILE" ]; then
    echo "Moving existing .bash_aliases to dotfiles repository..."
    mv "$ALIAS_FILE" "$DOTFILES_DIR/.bash_aliases"
elif [ ! -f "$DOTFILES_DIR/.bash_aliases" ]; then
    echo "Creating master .bash_aliases in dotfiles..."
    cat << EOF > "$DOTFILES_DIR/.bash_aliases"
alias install='sudo apt install'
alias uninstall='sudo apt remove'
EOF
fi

# 5. Create the Symbolic Link
# This makes ~/.bash_aliases point to ~/dotfiles/.bash_aliases
echo "Creating symbolic link..."
ln -sf "$DOTFILES_DIR/.bash_aliases" "$ALIAS_FILE"

# 6. Fix Permissions
# Ensure the user owns both the directory and the link
chown -R "$REAL_USER:$REAL_USER" "$DOTFILES_DIR"
chown -h "$REAL_USER:$REAL_USER" "$ALIAS_FILE"

echo "------------------------------------------------"
echo "Setup complete!"
echo "Your aliases are now safely stored in: $DOTFILES_DIR"
echo "Linked to: $ALIAS_FILE"
echo "Run 'source ~/.bashrc' to finish."