# krittapastrycode-skills

Personal Claude Code config — workflow skills, coding rules, personal CLAUDE.md, and plugins.
Inspired by [9arm workflow](https://github.com/9arm) + [Andrej Karpathy's LLM coding guidelines](https://x.com/karpathy/status/2015883857489522876).

## Install on a new machine

```bash
# 1. Install oh-my-claudecode (the framework)
curl -fsSL https://raw.githubusercontent.com/getomni/oh-my-claudecode/main/install.sh | bash

# 2. Clone and install everything (config + plugins)
git clone https://github.com/krittapastrycode/krittapastrycode-skills.git
cd krittapastrycode-skills
bash install.sh
```

## What's inside

| File/Folder | Description |
|---|---|
| `CLAUDE.md` | Main Claude Code config with oh-my-claudecode setup |
| `skill.md` | Personal workflow skills (9arm style) |
| `rules/` | Coding standards for web, TypeScript, PHP, Go, Python, etc. |
| `settings.json` | Claude Code permissions |
| `install.sh` | One-command installer (config + plugins) |

## Plugins installed

| Plugin | Marketplace source | Skills | Description |
|--------|-------------------|--------|-------------|
| `andrej-karpathy-skills` | `multica-ai/andrej-karpathy-skills` | `karpathy-guidelines` | LLM coding discipline from Andrej Karpathy |
| `ponytail` | `DietrichGebert/ponytail` | `ponytail`, `ponytail-audit`, `ponytail-debt`, `ponytail-help`, `ponytail-review` | Lazy senior dev mode — YAGNI, stdlib first |

### Karpathy Guidelines (`/andrej-karpathy-skills:karpathy-guidelines`)

4 principles to reduce LLM coding mistakes:

1. **Think Before Coding** — surface assumptions, ask when unclear
2. **Simplicity First** — minimum code, nothing speculative
3. **Surgical Changes** — touch only what you must
4. **Goal-Driven Execution** — define verifiable success criteria before looping

### Ponytail

Lazy senior dev mode. Forces simplest solution. YAGNI + stdlib first.

| Skill | Usage |
|-------|-------|
| main | `/ponytail:ponytail` |
| audit existing code for overengineering | `/ponytail:ponytail-audit` |
| identify & prioritize tech debt | `/ponytail:ponytail-debt` |
| help with ponytail usage | `/ponytail:ponytail-help` |
| review code for unnecessary complexity | `/ponytail:ponytail-review` |

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
