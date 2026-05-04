# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## What this repository is

A portable AI agent skill (`design-taste`) that gives AI coding agents senior product designer judgment when building or reviewing frontend UI. It is a documentation and configuration repository — there is no build step, no test suite, and no dependencies to install.

## Key command

```bash
# Returns the path to the skill's SKILL.md file (used by skill loaders)
source ./skill.sh design-taste
```

## Architecture

### Source of truth

`skills/design-taste/SKILL.md` is the canonical content layer. Everything else derives from it.

It contains:
- YAML frontmatter (`name`, `description`) consumed by Claude Code and Codex skill loaders
- Core design principles (the 5 rules, 7 principle categories, pre-output checklist, anti-patterns, motion, responsive, states)
- A **Reference Routing** section that maps task types to specific files in `references/`

### Reference files

`skills/design-taste/references/` contains deep-dive guidance loaded on demand — never all at once. The routing logic in `SKILL.md` determines which file applies to which task. Do not collapse references into `SKILL.md`.

### Adapter files

Three files embed `SKILL.md` content inline because Cursor and Copilot cannot dynamically load files:

| File | Tool | Notes |
|---|---|---|
| `.cursor/rules/design-taste.mdc` | Cursor | MDC frontmatter + condensed SKILL.md content; globs activate it on frontend files |
| `.github/copilot-instructions.md` | GitHub Copilot | Full design judgment content; users copy this to their project's `.github/` |
| `skills/design-taste/agents/claude.yaml` | Claude Code | Thin config pointing to SKILL.md |
| `skills/design-taste/agents/openai.yaml` | OpenAI Codex | Thin config for Codex skill loader |

**When SKILL.md changes**, the adapter files must be updated to stay in sync. The Cursor and Copilot files are not auto-generated — they require a manual sync pass.

## Editorial rules

- Keep `SKILL.md` focused on principles and routing logic. Detailed component/pattern guidance belongs in `references/`.
- The YAML frontmatter `description` field in `SKILL.md` is what skill loaders surface to users. Keep it accurate.
- `README.md` is the public-facing install guide. The "What It Optimizes For" section should stay aligned with the actual principles in `SKILL.md`.
- `examples/prompts.md` has prompt templates per tool (Claude Code, Cursor, Copilot, Codex). Add examples there when new usage patterns emerge.
- No magic numbers, no one-off styling, no generated marketing claims the skill does not support (per `.github/copilot-instructions.md` repo style).
