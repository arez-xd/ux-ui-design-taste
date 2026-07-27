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

### The two-tier rule model

The skill deliberately separates two kinds of guidance, and `SKILL.md` states the split explicitly in the "What Is Fixed, and What Is Only a Default" section:

- **Non-negotiable** — the quality floor (contrast, touch targets, focus, semantics, compositor-friendly animation, state coverage, content realism). Written as imperatives. Never softened.
- **Defaults** — aesthetic calls that are right for most products but wrong for some (shadows vs borders, motion durations, accent count, minimal-with-pops). Written as a question plus a small set of context-keyed answers.

The mechanism that keeps every project from looking alike is **"Set the Dials First"** in `SKILL.md`: a one-pass, three-question context read (product type, density, expressiveness) that runs before any principle is applied. It is deliberately a single upfront pass, not per-decision Q&A — the goal is calibration, not an interrogation loop. `references/visual-dials.md` holds the deeper calibration guidance.

When adding guidance, decide which tier it belongs to first. Aesthetic preferences written as universal imperatives are what produces the "every output looks the same" failure this structure exists to prevent.

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
- Before adding a rule, classify it: quality floor (imperative) or aesthetic default (question + context-keyed answers). See the two-tier model above.
- The YAML frontmatter `description` field in `SKILL.md` is what skill loaders surface to users. Keep it accurate.
- `README.md` is the public-facing install guide. The "What It Optimizes For" section should stay aligned with the actual principles in `SKILL.md`.
- `examples/prompts.md` has prompt templates per tool (Claude Code, Cursor, Copilot, Codex). Add examples there when new usage patterns emerge.
- No magic numbers, no one-off styling, no generated marketing claims the skill does not support (per `.github/copilot-instructions.md` repo style).
