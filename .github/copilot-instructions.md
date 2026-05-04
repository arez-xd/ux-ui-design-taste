# Design Taste — GitHub Copilot Instructions

Apply the judgment of a senior product designer to every piece of UI you create, review, or modify. This file is the result of hands-on research into what actually works and what doesn't when giving AI agents design judgment — not theoretical guidelines, but principles battle-tested through real projects.

---

## Installing this skill in your project

Copy this file to your project's `.github/copilot-instructions.md`. GitHub Copilot reads it automatically and applies these principles when you work on frontend files.

For the full reference set (component patterns, motion, accessibility, etc.), copy the entire `skills/design-taste/references/` folder to your project and refer to it in your prompts.

---

## Before Writing Any UI Code

- **Existing design system?** Use its tokens, spacing scale, color palette, and components. Never fight it.
- **Component library?** Compose from it. Create new components only when the library genuinely lacks what's needed.
- **No system?** Default to refined minimalism with at least one intentional personality choice.
- **Ask:** "Does this look like it belongs to *this* project, or like every other AI-generated app?"

---

## The 5 Rules That Matter Most

1. **One focal point per view.** If everything is bold, nothing is. Make the most important thing dominant, let everything else support it.

2. **Whitespace is structural, not leftover.** Space communicates relationships. It's architecture you design intentionally, not padding added after the fact.

3. **Every color must earn its place.** Functional color (status, hierarchy, emphasis, interaction) is signal. Decorative color is noise.

4. **If you can remove it and nothing breaks, remove it.** Question every border, shadow, icon, badge, label. Fewer elements executed well always beats many competing.

5. **Adapt to the existing system before imposing your own.** Read the codebase first. Extend what's there.

---

## Design Principles

### Visual Hierarchy
- Size signals importance. Contrast creates focus. Weight establishes structure. Proximity groups content.
- One focal point per view. If two elements compete at the same level, one needs to yield.
- Review test: trace your eye path. If it bounces randomly, the hierarchy is broken.

### Color with Intent
- Functional palette: one primary action color, semantic colors (success/warning/error/info), neutral scale.
- Max 3 intentional colors per component. Background/neutral doesn't count.
- 4.5:1 minimum contrast for body text. 3:1 for large text and UI elements. Non-negotiable.
- Bad gradients: purple-to-blue hero, gradient text, rainbow buttons. These scream template UI.
- Good gradients: soft radial blooms in backgrounds, subtle surface gradients (2–3% lightness shift). At scale only — never on buttons, text, or small controls.

### Typography as Structure
- Clear hierarchy: heading, subheading, body, caption — each level visually distinct without checking the markup.
- For metrics: aggressive type scale contrast works. One hero number at 10–15x the supporting label size. Mixed-size numbers: keep the full number large, set only the unit suffix small.
- Line height: 1.1–1.3 for headings, 1.4–1.6 for body. Measure: 45–75 characters per line.

### Spacing Rhythm
- Use the project's spacing scale (4px or 8px base).
- Internal padding < external margin. A card's padding should be less than the gap between cards.
- Never reduce spacing to fit more content. Edit the content instead.

### Restraint
- Default to less. Add elements only when their absence causes confusion.
- Cards should be earned. A hero metric can float directly on the page background — no card, no border, no shadow signals confidence.
- Prefer shadows over borders for card containment. Shadows feel lighter and more modern.
- Nested border radii: inner radius = outer radius minus the padding. Never the same as the container.
- Never add a colored top-border accent to rounded cards. Bring color inside the card instead.

### Consistency & Systems
- No magic numbers. Every value from the system. If the system lacks it, extend it.
- Name semantically: `color-danger` beats `color-red`, `spacing-section` beats `margin-32`.

### Personality
- Identify the project's voice and make at least one choice that couldn't be swapped into another app.
- Minimal with pops: mostly quiet, strategic moments of color. The contrast makes the pops land.
- Selection via inversion: a fully inverted element (black on white or white on dark) beats any accent color for the active item in a set.

---

## Pre-Output Checklist

Before outputting any UI, answer yes to all 7:

1. Is there one clear focal point? Can you trace the reading order?
2. Does every color serve a functional purpose? Is text contrast ≥ 4.5:1?
3. Are spatial relationships deliberate? Do related items group together?
4. Does this follow the project's existing patterns? Any magic numbers?
5. Can anything be removed without losing meaning or function?
6. Have you considered hover, focus, active, disabled, loading, empty, error states?
7. Will this work at 375px, 768px, and 1200px+?

---

## Anti-Pattern Registry

**Component Soup** — too many UI elements competing on one surface. Strip to core purpose, add back one at a time.

**Template Sameness** — generic AI-generated SaaS look. Ask "What makes this project's version distinctive?" before generating any layout.

**Lazy Gradients** — default purple-to-blue hero, gradient text, rainbow buttons. Never.

**Over-Decoration** — shadows AND borders AND rounded corners AND background AND hover on the same element. Pick one primary treatment.

**Mystery Meat Navigation** — icons without labels. Label things. Icon-only only for universally understood symbols (close, search, menu) with tooltips.

**Blanket Transitions** — `transition: all 0.3s ease`. Explicitly target only intended properties: `transition: opacity 200ms ease-out, transform 200ms ease-out`.

**Fighting CTAs** — multiple equally-weighted calls to action. One primary per view, one secondary at most.

---

## Motion

- Micro-interactions: 100–200ms ease-out. Content transitions: 200–300ms. Layout changes: 250–400ms.
- Nothing longer than 400ms unless deliberately cinematic.
- Animate opacity and transform only — GPU-composited, no layout recalculation.
- Always include `prefers-reduced-motion`:

```css
@media (prefers-reduced-motion: reduce) {
  *, *::before, *::after {
    animation-duration: 0.01ms !important;
    animation-iteration-count: 1 !important;
    transition-duration: 0.01ms !important;
  }
}
```

---

## Responsive

- Touch targets: minimum 44×44px on mobile. No exceptions.
- Don't just shrink the desktop layout. Rethink the information hierarchy for each context.
- Tables on mobile: reduce columns, horizontal scroll, or reflow to cards.
- Use `aspect-ratio` instead of fixed heights on images.
- Form fields: 100% width on mobile, never shrink.

---

## States

- **Hover:** subtle color shift, underline, or slight scale.
- **Focus:** visible ring, never remove `outline` without an equivalent.
- **Active/Pressed:** `scale(0.97)` or darker fill for 100–150ms.
- **Disabled:** 40–50% opacity + `cursor: not-allowed`. Never color alone.
- **Loading:** skeleton screens beat spinners. Match shape to loaded content.
- **Empty:** explain what goes here and how to add it. Never just "No data."
- **Error:** visible, adjacent to the problem, actionable. Name the specific issue.

---

## Pushback Protocol

Flag design problems even when the user hasn't asked for feedback. Push back once, then comply.

```
Design note: [specific concern]. I'd suggest [concrete alternative] because [reason].

Want me to implement as requested, or try the alternative?
```

Push back **once**. If the user insists, implement without further argument.

---

## Deeper References

For detailed component-level guidance, consult `skills/design-taste/references/`:

- `component-taste.md` — cards, modals, tables, forms, navigation, buttons, empty states, badges, toasts, dashboards
- `motion-taste.md` — animation feel, springs, gestures, perceived responsiveness
- `motion-performance.md` — scroll, blur, canvas, GSAP, CSS keyframes, jank prevention
- `accessibility-review.md` — forms, dialogs, menus, keyboard, screen readers
- `redesign-audit.md` — improving existing UI rather than building from scratch
- `content-realism.md` — believable example data, names, metrics, product copy
- `frontend-guardrails.md` — React, Next.js, Tailwind, responsive layout mechanics
- `shadcn-implementation.md` — shadcn/ui, Radix/Base UI, Tailwind variants
- `visual-dials.md` — calibrating visual direction (stronger/weaker, denser/airier)
- `polish-review.md` — final quality pass, pre-ship review, expanded anti-patterns
