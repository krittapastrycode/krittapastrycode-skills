#!/bin/bash
# Claude Code personal config installer
# Usage: bash install.sh

set -e

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
CLAUDE_DIR="$HOME/.claude"

echo "Installing claude config to $CLAUDE_DIR..."

mkdir -p "$CLAUDE_DIR"

cp "$DOTFILES_DIR/CLAUDE.md" "$CLAUDE_DIR/CLAUDE.md"
cp "$DOTFILES_DIR/skill.md" "$CLAUDE_DIR/skill.md"
cp "$DOTFILES_DIR/settings.json" "$CLAUDE_DIR/settings.json"
cp -r "$DOTFILES_DIR/rules" "$CLAUDE_DIR/rules"

echo "Done! Re-open Claude Code to apply."
echo ""
echo "Next: install oh-my-claudecode separately:"
echo "  curl -fsSL https://raw.githubusercontent.com/getomni/oh-my-claudecode/main/install.sh | bash"
