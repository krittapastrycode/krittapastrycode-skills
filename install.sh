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

echo "Config installed."
echo ""
echo "Installing plugins..."

# Add marketplaces
claude plugin marketplace add multica-ai/andrej-karpathy-skills
claude plugin marketplace add DietrichGebert/ponytail

# Install plugins
claude plugin install andrej-karpathy-skills@karpathy-skills
claude plugin install ponytail@ponytail

echo ""
echo "Done! Re-open Claude Code to apply."
echo ""
echo "Available skills:"
echo "  /andrej-karpathy-skills:karpathy-guidelines"
echo "  /ponytail:ponytail"
echo "  /ponytail:ponytail-audit"
echo "  /ponytail:ponytail-debt"
echo "  /ponytail:ponytail-help"
echo "  /ponytail:ponytail-review"
