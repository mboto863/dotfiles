# Python setup

# Install poetry.
if [ -v pipx > /dev/null ]; then
	pipx poetry
fi

if [ -v poetry > /dev/null ]; then
	poetry completions zsh > "$ZDOTDIR/completions/_poetry"
fi
