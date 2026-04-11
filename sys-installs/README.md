## Files
- What these files do / code segment breakdowns:
- `"$EUID" -ne 0`: Checking for Root privileges.
    - The `root` user always has a User ID of `0`. Bash automatically provides the `$EUID` (Effective User ID) variable. The `-ne` operator stands for "not equal." If `$EUID` is not equal to `0`, the script knows the user didn't run it with `sudo` or as root, and exits.
- `command -v apt >/dev/null 2>&1`: Silent command validation.
    - `command -v apt` is a safely check for if the `apt` command exists on the system without actually running it. `>/dev/null` takes the standard output (a successful finding of the command) and redirects it to `/dev/null`, which acts as a black hole, hiding the text from the user. `2>&1` in Linux, `1` is standard output and `2` is standard error. This ensures that if the command isn't found, the error message is also swallowed by the black hole.
- `tr`: Taking and normalizing user input.
    - `tr '[:upper:]' '[:lower:]'` is the "translate" command. It takes whatever the user typed and forces it into lowercase.
- `export DEBIAN_FRONTEND=noninteractive`: Silencing interactive prompts.
    - Installing packages using `apt` on Debian/Ubuntu-based systems, some packages trigger a interactive pop-up menu asking for configuration details (like selecting a timezone or keyboard layout). Setting this environment variable to `noninteractive` tells the package manager to accept default values and prevents these menus from freezing the silent installation script.
- `apt-get install -y -qq`: The quiet install flags.
    - `-y` automatically answers "yes" to the standard `apt` prompt asking if the user wants to use disk space to install software. `-qq` reduces the textual output of `apt-get` to the absolute minimum, hiding the scrolling download progress bars so the output remains visually clean.
- `if [ $? -ne 0 ]`: Verifying success.
    - `$?` variable is a special Bash parameter that holds the "exit status" of the very last command that finished running (in this case, the `apt-get install` command). By convention, an exit status of `0` means the program succeeded perfectly. Anything other than `0` (e.g., `1`, `100`) means an error occurred.

## Citation
- [Code clean up and troubleshooting](https://gemini.google.com/app)
- [Bash Variables](https://www.gnu.org/software/bash/manual/html_node/Bash-Variables.html)
- [Redirections](https://www.gnu.org/software/bash/manual/html_node/Redirections.html)
- [Bash Builtin Commands](https://www.gnu.org/software/bash/manual/html_node/Bash-Builtins.html)
- [Man Pages of debconf](https://manpages.ubuntu.com/manpages/focal/man7/debconf.7.html)
- [Man Pages of apt-get](https://manpages.ubuntu.com/manpages/focal/man8/apt-get.8.html)

- [Exit Status](https://www.gnu.org/software/bash/manual/html_node/Exit-Status.html)