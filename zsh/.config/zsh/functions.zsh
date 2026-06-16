# shorter octal list
function l() {
  ls -gGAhF --color=always "$@" \
    | sed -e 's/--x/1/g;s/-w-/2/g;s/-wx/3/g;s/r--/4/g;s/r-x/5/g;s/rw-/6/g;s/rwx/7/g;s/---/0/g;' \
    | sed -e 's/^\(....\) [[:digit:]] /\1 /'
}

function _activate_env() {
  if [[ -d .venv ]]; then
    source .venv/bin/activate
  elif [[ -d venv ]]; then
    source venv/bin/activate
  fi
}

# Quick run current script
function runpy() {
  if [[ -n $1 ]]; then
    python3 "$1"
  else
    # Run the most recently modified .py file in current dir
    local latest=$(ls -t *.py 2>/dev/null | head -n1)
    if [[ -n $latest ]]; then
      echo "Running $latest"
      python3 "$latest"
    else
      echo "No .py files found"
    fi
  fi
}