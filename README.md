# UX/UI Design Taste

<p align="center">
  <strong>Senior product design judgment for AI-assisted frontend work.</strong>
</p>

<p align="center">
  <a href="LICENSE"><img src="https://img.shields.io/badge/License-MIT-111827?style=for-the-badge" alt="MIT License" /></a>
  <a href="#install"><img src="https://img.shields.io/badge/Skill-design--taste-2563eb?style=for-the-badge" alt="design-taste skill" /></a>
  <a href="#use-cases"><img src="https://img.shields.io/badge/For-Codex%20%7C%20Frontend%20UI-0f766e?style=for-the-badge" alt="For Codex and frontend UI" /></a>
</p>

`design-taste` is a portable Codex skill for making AI-generated interfaces feel intentional: clearer hierarchy, stronger spacing, better typography, more restrained color, realistic content, accessible interaction states, and fewer generic template tells.

It is framework-agnostic. Use it with React, Next.js, HTML/CSS, Framer code components, shadcn/ui, or any frontend surface where visual quality matters.

## Install

Install the skill from this repository:

```bash
npx skills add https://github.com/arez-xd/ux-ui-design-taste --skill design-taste
```

Or copy the skill folder directly:

```text
skills/design-taste/
```

## Use Cases

Use `design-taste` when you want an AI coding agent to:

- Build a new frontend interface with stronger visual judgment.
- Review an existing UI and identify design issues before editing.
- Improve hierarchy, spacing, typography, color, and component polish.
- Redesign dashboards, data views, forms, navigation, modals, cards, and empty states.
- Add motion that feels intentional and remains performant.
- Avoid generic AI-generated SaaS layouts and placeholder content.

Example prompts:

```text
Use $design-taste to redesign this dashboard so it feels sharper and less generic.
```

```text
Use $design-taste to review this React component, then implement the polish pass.
```

```text
Use $design-taste and focus on accessibility, responsive behavior, and realistic content.
```

## Skill Structure

```text
skills/design-taste/
|-- SKILL.md
|-- agents/
|   `-- openai.yaml
`-- references/
    |-- accessibility-review.md
    |-- component-taste.md
    |-- content-realism.md
    |-- frontend-guardrails.md
    |-- motion-performance.md
    |-- motion-taste.md
    |-- polish-review.md
    |-- redesign-audit.md
    |-- shadcn-implementation.md
    `-- visual-dials.md
```

`SKILL.md` contains the core design judgment layer. The `references/` files are loaded only when the task calls for them, keeping the main skill focused while still giving the agent detailed guidance for specific UI work.

## What It Optimizes For

- One clear focal point per view.
- Spacing as structure, not leftover padding.
- Color that communicates function and hierarchy.
- Typography that creates scannable information architecture.
- Restraint over decoration.
- Existing design-system alignment before new styling.
- Interaction states, responsiveness, accessibility, and final polish.

## References

The skill routes deeper guidance by task type:

- `component-taste.md` for cards, tables, forms, dashboards, navigation, buttons, badges, toasts, and empty states.
- `motion-taste.md` and `motion-performance.md` for animation feel and performance guardrails.
- `accessibility-review.md` for forms, dialogs, menus, keyboard behavior, and screen reader output.
- `redesign-audit.md` for existing UI improvement.
- `content-realism.md` for believable example data and product copy.
- `frontend-guardrails.md` for implementation details in React, Next.js, Tailwind, and responsive layouts.
- `shadcn-implementation.md` for projects using shadcn/ui, Radix, Base UI, or `components/ui`.

## Common Questions

**Is this a component library?**  
No. It is an agent skill: reusable instructions and references that improve how an AI agent designs and implements UI.

**Does it require a specific framework?**  
No. The principles apply across frontend stacks. Framework-specific guidance is loaded only when useful.

**Can it be used for UI review only?**  
Yes. Ask the agent to use `$design-taste` for a review pass before implementation.

**Why split references out of SKILL.md?**  
Progressive disclosure. The agent reads the core rules first, then loads only the targeted reference files needed for the current task.

## License

[MIT](LICENSE) (c) 2026 Adam Reznik
