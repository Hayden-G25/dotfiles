#!/bin/bash

# 1. Check for root/sudo privileges (EUID 0)
if [ "$EUID" -ne 0 ]; then
  echo "Error: This script requires root privileges. Please run it with sudo or as the root user."
  exit 1
fi

# 2. Check if the apt package manager is available
if ! command -v apt >/dev/null 2>&1; then
  echo "Error: This script uses the 'apt' package manager, which was not found on your system."
  exit 1
fi

# 3. Check for command name conflicts
# If 'singularity' is already an executable command, exit to prevent unexpected behavior.
if command -v singularity >/dev/null 2>&1; then
  echo "Error: A command named 'singularity' already exists on this system."
  echo "Installation aborted to prevent overwriting or system behavior conflicts."
  exit 1
fi

# 4. Provide information and prompt the user for permission
echo "============================================================"
echo "Ready to install Singularity (singularity-container)."
echo "This will update your package lists and install Singularity"
echo "along with its required dependencies."
echo "============================================================"
read -p "Do you want to proceed with the installation? (y/n): " confirm

# Convert input to lowercase to handle 'Y' or 'y'
confirm=$(echo "$confirm" | tr '[:upper:]' '[:lower:]')

if [ "$confirm" != "y" ]; then
  echo "Installation canceled by the user. Exiting."
  exit 0
fi

# 5. Silently install the software
echo "Installing Singularity in the background... Please wait."

# Set noninteractive frontend to prevent configuration dialog boxes from interrupting the silent install
export DEBIAN_FRONTEND=noninteractive

# Update package lists and install quietly (-qq) and non-interactively (-y)
apt-get update -qq >/dev/null 2>&1
apt-get install -y -qq singularity-container >/dev/null 2>&1

# Verify the install succeeded
if [ $? -ne 0 ]; then
  echo "Error: The installation failed. You may need to run 'sudo apt-get update' manually to check for repository errors."
  exit 1
fi

# 6. Inform the user of completion and provide a test command
echo "Install complete!"
echo "You can verify the installation by running:"
echo "    singularity --version"