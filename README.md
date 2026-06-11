# krittapastrycode-skills

Personal Claude Code config — workflow skills, coding rules, and personal CLAUDE.md.

## What's inside

| File/Folder | Description |
|---|---|
| `CLAUDE.md` | Main Claude Code config with oh-my-claudecode setup |
| `skill.md` | Personal workflow skills (9arm style) |
| `rules/` | Coding standards for web, TypeScript, PHP, Go, Python, etc. |
| `settings.json` | Claude Code permissions |
| `install.sh` | One-command installer |

## Install on a new machine

```bash
# 1. Install oh-my-claudecode (the framework)
curl -fsSL https://raw.githubusercontent.com/getomni/oh-my-claudecode/main/install.sh | bash

# 2. Clone and install this config
git clone https://github.com/krittapastrycode/krittapastrycode-skills.git
cd krittapastrycode-skills
bash install.sh
```

## Update config

After changing any file in `~/.claude`, sync it back:

```bash
cd ~/path/to/krittapastrycode-skills
cp ~/.claude/CLAUDE.md .
cp ~/.claude/skill.md .
cp ~/.claude/settings.json .
cp -r ~/.claude/rules .
git add -A && git commit -m "chore: sync config" && git push
```

## Stack

Primarily used for:
- **horoacademy-wpe-frontend** — Nuxt 3 / Vue
- **horoacademy-wpe-service** — Laravel / PHP
- **horoacademy-backoffice** — Laravel / PHP
