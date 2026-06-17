#!/bin/bash
# krittapastrycode-skills bootstrap installer
# Usage: curl -fsSL https://raw.githubusercontent.com/krittapastrycode/krittapastrycode-skills/main/install.sh | bash

set -e

REPO="https://github.com/krittapastrycode/krittapastrycode-skills.git"
CLONE_DIR="$HOME/.krittapastrycode-skills"
CLAUDE_DIR="$HOME/.claude"

echo "==> [1/5] Installing oh-my-claudecode..."
curl -fsSL https://raw.githubusercontent.com/getomni/oh-my-claudecode/main/install.sh | bash

echo ""
echo "==> [2/5] Cloning krittapastrycode-skills..."
rm -rf "$CLONE_DIR"
git clone "$REPO" "$CLONE_DIR"

echo ""
echo "==> [3/5] Copying config files to $CLAUDE_DIR..."
mkdir -p "$CLAUDE_DIR"
cp "$CLONE_DIR/CLAUDE.md"    "$CLAUDE_DIR/CLAUDE.md"
cp "$CLONE_DIR/skill.md"     "$CLAUDE_DIR/skill.md"
cp "$CLONE_DIR/settings.json" "$CLAUDE_DIR/settings.json"
cp -r "$CLONE_DIR/rules"     "$CLAUDE_DIR/rules"

echo ""
echo "==> [4/5] Installing skills packs..."
npx skills@latest add thananon/9arm-skills
npx skills@latest add mattpocock/skills

echo ""
echo "==> [5/5] Installing Claude Code plugins..."
claude plugin marketplace add multica-ai/andrej-karpathy-skills
claude plugin marketplace add DietrichGebert/ponytail
claude plugin install andrej-karpathy-skills@karpathy-skills
claude plugin install ponytail@ponytail

echo ""
echo "✅ Done! Re-open Claude Code to apply."
echo ""
echo "Installed:"
echo "  - oh-my-claudecode (OMC)"
echo "  - 9arm-skills (debug-mantra, scrutinize, post-mortem, management-talk)"
echo "  - matt-pocock-skills (tdd, grill-me, to-issues, to-prd, handoff, ...)"
echo "  - andrej-karpathy-skills (karpathy-guidelines)"
echo "  - ponytail (ponytail, ponytail-audit, ponytail-debt, ponytail-help, ponytail-review)"
