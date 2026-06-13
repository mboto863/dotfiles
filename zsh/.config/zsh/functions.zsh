# shorter octal list
function l() {
	ls -gGAhF --color=always "$@" \
		| sed -e 's/--x/1/g;s/-w-/2/g;s/-wx/3/g;s/r--/4/g;s/r-x/5/g;s/rw-/6/g;s/rwx/7/g;s/---/0/g;' \
		| sed -e 's/^\(....\) [[:digit:]] /\1 /'
}

# Automatically activate Poetry virtual environments
function _auto_poetry_activate() {
	if [ -f "pyproject.toml" ]; then
		# Check if a poetry env actually exists for this project
	  	if poetry env info --path > /dev/null 2>&1; then
			source "$(poetry env info --path)/bin/activate"
		fi
	fi
}
