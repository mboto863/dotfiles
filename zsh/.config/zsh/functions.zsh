# shorter octal list
function l() {
  ls -gGAhF --color=always "$@" \
    | sed -e 's/--x/1/g;s/-w-/2/g;s/-wx/3/g;s/r--/4/g;s/r-x/5/g;s/rw-/6/g;s/rwx/7/g;s/---/0/g;' \
    | sed -e 's/^\(....\) [[:digit:]] /\1 /'
}

# =============================================================================
# Notes
# =============================================================================

# Open or create today's daily note.
nd() {
  mkdir -p "$NOTES_DIR/daily"  
  local file="$NOTES_DIR/daily/$(date +%F).md"
  if [[ ! -f "$file" ]]; then
    printf "# %s\n\n" "$(date +%F)" > "$file"
  fi
  "$EDITOR" "$file"
} 

# Create or open a named note in $NOTES_DIR.
n() {
  mkdir -p "$NOTES_DIR" # aliases.zsh is already sourced at this point.
  if [[ $# -eq 0 ]]; then
    "$EDITOR" "$NOTES_DIR"
    return
  fi
  # file name is passed.
  local slug="${*// /-}" 
  local file="$NOTES_DIR/${slug}.md"
  "$EDITOR" "$file"
}

# Ripgrep search across notes and open the match in Helix at line number.
ng() {
  local match=$(
    rg \
      --line-number \
      --no-heading \
      --smart-case \
      "${*:-}" \
      "$NOTES_DIR" \
    | fzf \
      --delimiter=: \
      --preview 'bat --style=numbers --color=always --highlight-line {2} {1}'
  ) || return
  local file="${match%%:*}"
  local rest="${match#*:}"
  local line="${rest%%:*}"
  "$EDITOR" "${file}:${line}"
}

# =========================================================
# Python
# =========================================================
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

# Run this as: pytrack logs_filename
pytrack() {
    local log_file=${1:-".logs"}

    # Touch the file to ensure it exists before tailing.
    touch "$log_file"

    # Split horizontally, give 30% space to the bottom pane, and run the watch command
    # Using 'less +F' allows one to scroll backward and resume watching with keybindings.
    tmux split-window -v -p 30 \
    "tail -f $log_file | grep --line-buffered \".\" | less"

    # Keep focus on the shell pane.
    tmux select-pane -t :.-
}
