# shorter octal list
function l() {
	ls -gGAhF --color=always "$@" \
		| sed -e 's/--x/1/g;s/-w-/2/g;s/-wx/3/g;s/r--/4/g;s/r-x/5/g;s/rw-/6/g;s/rwx/7/g;s/---/0/g;' \
		| sed -e 's/^\(....\) [[:digit:]] /\1 /'
}
