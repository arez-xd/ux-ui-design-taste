# design-taste

This repository contains the `design-taste` AI agent skill — portable senior design judgment for frontend UI work.

## Using this skill in Claude Code

### Option 1: Install as a Claude Code skill

Copy `skills/design-taste/` into your project's `.claude/skills/` directory:

```bash
cp -r skills/design-taste path/to/your-project/.claude/skills/
```

Claude Code will pick up the skill automatically. Reference it in prompts with `$design-taste`.

### Option 2: Inject into CLAUDE.md

Copy the contents of `skills/design-taste/SKILL.md` into your project's `CLAUDE.md`. The references in `references/` can be copied alongside it and linked with relative paths.

### Option 3: Reference inline

Paste the SKILL.md content directly into a prompt for a one-shot design pass without installation.

---

## Editing this skill

- **Core behavior and routing:** `skills/design-taste/SKILL.md`
- **Deep-dive references:** `skills/design-taste/references/`
- **Claude agent config:** `skills/design-taste/agents/claude.yaml`
- **Codex agent config:** `skills/design-taste/agents/openai.yaml`

Rules:
- Keep `SKILL.md` focused on principles and routing. Details go in `references/`.
- Do not load or duplicate every reference into `SKILL.md` — the routing section handles that.
- Preserve YAML frontmatter (`name`, `description`) — both Claude Code and Codex read it.
- When you update `SKILL.md`, sync the summary content in:
  - `.github/copilot-instructions.md` (Copilot uses this as live context)
  - `.cursor/rules/design-taste.mdc` (Cursor uses this as live context)
  - `README.md` "What It Optimizes For" section
