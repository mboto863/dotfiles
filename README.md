Manually:

/etc/zshenv should set the environment variables XDG_CONFIG_HOME and ZDOTDIR
```
if [ -z "$XDG_CONFIG_HOME" ]
then
        export XDG_CONFIG_HOME="$HOME/.config"
fi

if [ -d "$XDG_CONFIG_HOME/zsh" ]
then
        export ZDOTDIR="$XDG_CONFIG_HOME/zsh"
```
