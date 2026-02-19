if command -v cursor &>/dev/null; then
  CODE_BIN="cursor"
elif command -v code &>/dev/null; then
  CODE_BIN="code"
fi

if [ -n "$CODE_BIN" ]; then
  # Add the bin directory to PATH to access vscode-pager
  export PATH="$HOME/.zim/modules/zsh-vscode-git-cli/bin:$PATH"

  # Use VSCode as the pager for git CLI
  export GIT_PAGER="vscode-pager.sh"

  # Use VSCode to edit messages in git CLI
  export GIT_EDITOR="$CODE_BIN -w"
fi
