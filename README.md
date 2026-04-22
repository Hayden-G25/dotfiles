## Dotfiles
- A collection of configuration files and installation scripts to quickly provision and standardize the environment.

## Repository Contents
- This repository is organized into specific domains to keep configurations modular and easy to manage. The repository primarily utilizes Shell scripts and Vim Script.
    - `homefiles/`: Contains user-specific configuration files (dotfiles) intended to be linked or copied to the home directory (e.g., shell profiles, environment aliases).
    - `sys-installs/`: Contains system-level installation scripts and package lists required for bootstrapping a fresh system setup.
    - `vim-config/`: Dedicated configurations and customizations for the Vim text editor. (See the `vim-config` directory for its task-specific README if applicable).
    - `install.sh`: The main executable deployment script used to symlink the dotfiles and orchestrate the installation process.

## How to Clone & Utilize
1. Clone the repository:
- `git clone https://github.com/Hayden-G25/dotfiles.git ~/.dotfiles`
- `cd ~/.dotfiles`

2. Execute the installation script:
- Review the `install.sh` script to ensure you understand which files will be overwritten or symlinked, then run:
- `chmod +x install.sh`
- `./install.sh`


## Retrospective & Desired Improvements
- Improvement 1:
    - Adding arguments to the `install.sh` script to allow for targeted, profile-based deployments (e.g., running ./install.sh --server versus ./install.sh --desktop).
- Improvement 2:
    - Expand the homefiles directory to track and symlink configurations for remote management and cloud tools. Incorporating files like `~/.ssh/config` or AWS CLI configurations (`~/.aws/config`) into my repository ensures that the host shortcuts, port forwarding rules, and access policies for storage buckets are instantly standardized across any machine that is set up.
