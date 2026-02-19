#!/bin/zsh

file="$1"
if [ ! -f "$file" ]; then
  file=-
fi

# A shell function to view piped content in VS Code with a specific language mode.

# 1. Create a temporary file with a .ansi extension.
#    The ANSI Colors extension will activate based on this extension.
local tmpfile=$(mktemp /tmp/git-log.XXXXXX)
if [ "$?" -ne 0 ]; then
  echo "Failed to create temporary file" >&2
  exit 1
fi

local tmpfile_ext="${tmpfile}.ansi"
mv "$tmpfile" "$tmpfile_ext"

# 2. Set up the trap
# This removes the file on EXIT (normal finish),
# SIGINT (Ctrl+C), and SIGTERM (kill command).
trap 'rm -f "$tmpfile_ext"' EXIT SIGINT SIGTERM

# 3. Read the content from standard input (from git) and write it to the temp file.
cat "$file" > "$tmpfile_ext"

# 4. Open the temporary file in VS Code and wait until the tab is closed.
#    The -w flag is essential for git to work correctly.
code -w "$tmpfile_ext"
