# Example Prompts

Prompts for each supported AI coding tool.

---

## Claude Code

### Greenfield UI

```text
Use $design-taste to build this app screen. Prioritize hierarchy, restrained color, realistic content, and responsive behavior.
```

### Redesign Pass

```text
Use $design-taste to audit the existing UI first, then implement a focused redesign pass. Keep the current product structure, but improve spacing, hierarchy, component polish, and empty/error states.
```

### Dashboard Polish

```text
Use $design-taste to make this dashboard feel more intentional. Reduce card clutter, improve metric typography, tighten scanability, and keep the interface dense without feeling cramped.
```

### Component Review

```text
Use $design-taste to review this component for visual hierarchy, accessibility, responsive behavior, and interaction states. Then patch only the issues that materially improve the UI.
```

### Motion

```text
Use $design-taste with the motion references. Add subtle motion that improves perceived responsiveness without introducing scroll jank or decorative noise.
```

### Shadcn/UI Project

```text
Use $design-taste for this shadcn/ui project. Preserve existing primitives and variants, improve composition and state coverage, and avoid one-off styling that fights the component system.
```

---

## Cursor

### Build New UI

```text
Apply design-taste principles to this component. One focal point, deliberate spacing, restrained color. Make it feel considered, not generated.
```

### Review Pass

```text
Review this page using design-taste. Identify the top 3 issues with hierarchy, spacing, and consistency. Then fix them.
```

### Dashboard

```text
Apply design-taste to this dashboard. Focus on metric typography, card restraint, and scanability. Reference the component-taste guidelines in skills/design-taste/references/component-taste.md.
```

### Motion

```text
Add transitions to this component using design-taste principles. Only opacity and transform, nothing longer than 300ms, include prefers-reduced-motion.
```

---

## GitHub Copilot

With `.github/copilot-instructions.md` installed, Copilot applies design-taste automatically. You can also be explicit:

### Build

```text
Build this component. Apply senior designer judgment — one focal point, deliberate spacing, no decoration that doesn't serve a purpose.
```

### Review

```text
Review this component for design issues. Check hierarchy, color intent, spacing rhythm, and interaction states.
```

### Polish

```text
Do a final design pass on this page. Remove anything that can be removed. Verify the pre-output checklist.
```

---

## OpenAI Codex

```text
Use $design-taste to refine this interface and make it feel intentional.
```

```text
Use $design-taste to redesign this dashboard so it feels sharper and less generic.
```

```text
Use $design-taste to review this React component, then implement the polish pass.
```

```text
Use $design-taste and focus on accessibility, responsive behavior, and realistic content.
```
