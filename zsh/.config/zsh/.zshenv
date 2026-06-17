# ~/.config./zsh/.zshenv

# ------------- XDG base directories ----------------------
# Centralizes config/cache/data locations
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"

# ---------------- PATH -----------------------------------
# Personal binaries/scripts
export PATH="$HOME/.local/bin:$PATH"

# ---------------------------------------------------------
export EDITOR="code --wait"

# =========================================================
# PySpark
# =========================================================

# Tell PySpark to use IPython as its driver.
export PYSPARK_DRIVER_PYTHON="ipython"

# Clean IPython.
export PYSPARK_DRIVER_PYTHON_OPTS="--no-banner"

# Add Java runtime path to the environment.
# Dynamically find the system Java path.
export JAVA_HOME=$(readlink -f /usr/bin/java | sed "s:/bin/java::")