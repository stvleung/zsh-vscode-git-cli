if command -v code &>/dev/null; then
  # Add the bin directory to PATH to access vscode-pager
  export PATH="$HOME/.zim/modules/zsh-vscode-git-cli/bin:$PATH"

  # Use VSCode as the pager for git CLI
  export GIT_PAGER="vscode-pager.sh"

  # Use VSCode to edit messages in git CLI
  export GIT_EDITOR="code -w"
fi
