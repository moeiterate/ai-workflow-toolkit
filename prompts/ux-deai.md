# UX De-AI-ification

**When to use:** After MVP works. Before considering it "done".

## Prompt

```
Take the role of a principal-level UX designer. Review this application built with [COMPONENT LIBRARY].

Goal: Make the design unrecognizable from standard [LIBRARY] implementations.

Propose specific changes to:
1. Color palette (move away from defaults)
2. Typography (unique font pairings, hierarchy)
3. Spacing system (break conventional patterns where it helps)
4. Component styling (buttons, inputs, cards, navigation)
5. Micro-interactions (hover, focus, loading states)
6. Layout patterns (grids, spacing, asymmetry)

Maintain WCAG 2.1 AA accessibility. Provide specific CSS/Tailwind changes with before/after examples.
```

## Usage

- Run AFTER functionality works
- Specify your component library (shadcn, MUI, etc.)
- Request concrete code changes
- Test accessibility after changes

## Why

Generic AI designs hurt credibility. Your product shouldn't look like every other AI-generated app.

## Common Generic Patterns to Avoid

- Blue/purple gradients everywhere
- Perfect 8px spacing grid
- Border radius: 0.5rem on everything
- Inter/SF Pro font only
- Gray 50/100/200 backgrounds
