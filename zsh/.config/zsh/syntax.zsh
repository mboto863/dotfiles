# source the plugin
loc=${ZDOTDIR:-"$HOME/.config/zsh"}
L="$loc/syntaxhighlighting/zsh-syntax-highlighting.zsh"
S="/usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
if [ ! -f "$S" ] && [ ! -f "$L" ]; then
	git clone --depth=1 https://github.com/zsh-users/zsh-syntax-highlighting.git "$loc/syntaxhighlighting"
	source "$L"
else
	[ -f "$S" ] && source "$S"
	[ -f "$L" ] && source "$L"
fi
