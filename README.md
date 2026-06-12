Manually:

`/etc/zshenv` should set the environment variables `XDG_CONFIG_HOME` and `ZDOTDIR`
```
if [ -z "$XDG_CONFIG_HOME" ]
then
        export XDG_CONFIG_HOME="$HOME/.config"
fi

if [ -d "$XDG_CONFIG_HOME/zsh" ]
then
        export ZDOTDIR="$XDG_CONFIG_HOME/zsh"
fi

## XDG Base Directory Specification

The Big Four: What Each Folder Means
1. $HOME/.config
What it is: The birthplace of configuration files.

The standard variable: XDG_CONFIG_HOME (Defaults to $HOME/.config)

Data type: Static text files that you write or edit (e.g., starship.toml, git/config, nvim/init.lua).

Dotfiles Strategy: This is the core of your dotfiles repo. You want to version control almost everything inside this folder.

2. $HOME/.local/share
What it is: Persistent data files that the application needs to function, but you rarely edit manually.

The standard variable: XDG_DATA_HOME (Defaults to $HOME/.local/share)

Data type: Application state, installed plugins, themes, database files (e.g., local PostgreSQL data, Neovim plugins, Zsh completions).

Dotfiles Strategy: Ignore it. Do not commit this to Git; it contains heavy, machine-generated files that vary by computer.

3. $HOME/.local/state
What it is: Non-essential, persistent state information.

The standard variable: XDG_STATE_HOME (Defaults to $HOME/.local/state)

Data type: Command histories (.zsh_history), log files, application run states, or the "cursor position" memory of your text editor.

Dotfiles Strategy: Ignore it. You want your Zsh history to persist on your machine, but you never want to commit your shell history to GitHub (hello, accidental cloud credentials!).

4. $HOME/.cache
What it is: Non-essential, volatile data that can be deleted at any time without losing settings.

The standard variable: XDG_CACHE_HOME (Defaults to $HOME/.cache)

Data type: Package manager caches (like pip or brew downloads), temporary buffers, or preview thumbnails.

Dotfiles Strategy: Ignore it completely. It can safely be wiped to free up disk space.

```
