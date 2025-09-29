#!/bin/zsh

file="$1"
if [ ! -f "$file" ]; then
  file=-
fi

# A shell function to view piped content in VS Code with a specific language mode.

# 1. Create a temporary file with a .ansi extension.
#    The ANSI Colors extension will activate based on this extension.
local tmpfile=$(mktemp /tmp/git-log.XXXXXX.ansi)

# 2. Read the content from standard input (from git) and write it to the temp file.
cat "$file" > "$tmpfile"

# 3. Open the temporary file in VS Code and wait until the tab is closed.
#    The -w flag is essential for git to work correctly.
code -w "$tmpfile"

# 4. Clean up by deleting the temporary file after it's been closed.
rm "$tmpfile"
