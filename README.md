# krittapastrycode-skills

Personal Claude Code config — workflow skills, coding rules, personal CLAUDE.md, and plugins.

## Install on a new machine

```bash
curl -fsSL https://raw.githubusercontent.com/krittapastrycode/krittapastrycode-skills/main/install.sh | bash
```

That's it. Installs OMC, config files, 9arm-skills, matt-pocock-skills, karpathy-guidelines, and ponytail in one shot.

## What's inside

| File/Folder | Description |
|---|---|
| `CLAUDE.md` | Main Claude Code config with oh-my-claudecode setup |
| `skill.md` | Personal workflow skills (9arm style) |
| `rules/` | Coding standards for web, TypeScript, PHP, Go, Python, etc. |
| `settings.json` | Claude Code permissions |
| `install.sh` | One-command installer (config + plugins + skills) |

## Everything installed

### Frameworks

| Name | Source | Install method |
|------|--------|---------------|
| oh-my-claudecode (OMC) | `getomni/oh-my-claudecode` | `curl install.sh` |

### Plugins (via `claude plugin install`)

| Plugin | Source | Skills |
|--------|--------|--------|
| `andrej-karpathy-skills` | `multica-ai/andrej-karpathy-skills` | `karpathy-guidelines` |
| `ponytail` | `DietrichGebert/ponytail` | `ponytail`, `ponytail-audit`, `ponytail-debt`, `ponytail-help`, `ponytail-review` |

### Skills packs (via `npx skills add`)

| Pack | Source | Skills |
|------|--------|--------|
| 9arm-skills | `thananon/9arm-skills` | `debug-mantra`, `scrutinize`, `post-mortem`, `management-talk`, `qwen-agent`, `qwenchance` |
| Matt Pocock skills | `mattpocock/skills` | `ask-matt`, `grill-with-docs`, `triage`, `improve-codebase-architecture`, `setup-matt-pocock-skills`, `to-issues`, `to-prd`, `prototype`, `tdd`, `grill-me`, `handoff`, `teach`, `git-guardrails-claude-code`, `setup-pre-commit`, and more |

## Skills reference

### Karpathy Guidelines (`/andrej-karpathy-skills:karpathy-guidelines`)
1. **Think Before Coding** — surface assumptions, ask when unclear
2. **Simplicity First** — minimum code, nothing speculative
3. **Surgical Changes** — touch only what you must
4. **Goal-Driven Execution** — define verifiable success criteria before looping

### Ponytail (`/ponytail:ponytail`)
Lazy senior dev mode. YAGNI + stdlib first.

| Skill | Usage |
|-------|-------|
| main | `/ponytail:ponytail` |
| audit for overengineering | `/ponytail:ponytail-audit` |
| identify tech debt | `/ponytail:ponytail-debt` |
| help | `/ponytail:ponytail-help` |
| review complexity | `/ponytail:ponytail-review` |

### 9arm-skills (`thananon/9arm-skills`)
| Skill | Usage |
|-------|-------|
| debug-mantra | `/debug-mantra` |
| scrutinize | `/scrutinize` |
| post-mortem | `/post-mortem` |
| management-talk | `/management-talk` |

### Matt Pocock skills (`mattpocock/skills`)
| Skill | Usage |
|-------|-------|
| grill-me | `/grill-me` |
| tdd | `/tdd` |
| to-issues | `/to-issues` |
| to-prd | `/to-prd` |
| improve-codebase-architecture | `/improve-codebase-architecture` |
| handoff | `/handoff` |

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
