# Ubuntu Bash Customization Project

This repository contains configuration files and automation scripts to streamline the Ubuntu terminal experience.

## Files Included

* **`.bash_aliases`**: A collection of custom shortcuts (aliases) for common terminal commands.
* **`setup_aliases.sh`**: A bash script that automates the environment setup, installs dependencies, and manages symbolic links.

## Custom Aliases

| Alias | Command | Description |
| :--- | :--- | :--- |
| `install` | `sudo apt install` | Installs the package/software that the user prompts. |
| `uninstall` | `sudo apt remove` | Removes an existing package/software from the system that the user prompts. |

## Installation & Setup

1.  **Run the Setup Script**:
    The script must be ran with `sudo` to install dependencies and configure the symbolic links.
    ```bash
    sudo ./setup_aliases.sh
    ```

2.  **Refresh the Shell**:
    After the script finishes, reload your configuration:
    ```bash
    source ~/.bashrc
    ```

## How it Works
The `setup_aliases.sh` script installs basic tools (`curl`, `git`, `htop`), moves the `.bash_aliases` file into a centralized directory, and creates a **Symbolic Link** in the home directory pointing to the repository. This ensures that any changes made to the aliases in this folder are automatically reflected in the system.


## Citation
[Linux: 70 commands aliases for everyday life](https://davidjguru.github.io/blog/linux-70-commands-aliases-for-everyday-life) - Used for inspiration for my aliases and guided me on how to connect my .bash_aliases file to my .bashrc file

[How To Run the .sh File Shell Script In Linux / UNIX](https://www.cyberciti.biz/faq/run-execute-sh-shell-script/) - Used as a refresher for creating a .sh file and how to give the .sh file executable permissions.