# Step-by-Step Implementation Template

**Use for:** Learning new tech, regulatory compliance (HIPAA, SOC2), high complexity.

## Template

```markdown
---
alwaysApply: false
description: [PROJECT NAME] — [BRIEF DESCRIPTION]
---

## [PROJECT NAME] — Implementation Plan

[2-3 sentence project overview]

## Rules
- Complete one substep at a time, no exceptions
- After finishing substep, mark complete, await permission for next
- Run linters after each substep (npm run lint, ReadLints tool)
- Fix errors before proceeding
- Wait for user confirmation at phase boundaries
- Keep changes focused to current substep

### Phase A — [FOUNDATION]
- [ ] 1. [Master Step]
  - [ ] 1.1. [Specific deliverable]
  - [ ] 1.2. [Specific deliverable]
  - [ ] 1.3. [Specific deliverable]
- [ ] 2. [Master Step]
  - [ ] 2.1. [Deliverable]

**Acceptance**
- [ ] Specific testable criteria
- [ ] Another criteria

### Phase B — [CORE FEATURES]
[Repeat structure]

### Phase C — [POLISH]
[Repeat structure]

### Phase D — [SECURITY]
[Repeat structure]

### Phase E — [DEPLOYMENT]
[Repeat structure]

---

## Out of Scope (Future)
- [Deferred features]
```

## When to Use

- ✅ Learning new technology stack
- ✅ High complexity/risk projects
- ✅ Regulatory requirements (HIPAA, SOC2, etc.)
- ✅ Team collaboration needed
- ✅ Want maximum control

## Characteristics

- One substep at a time
- Linting after each substep
- User approval at phase boundaries
- High control, slower pace
- Minimizes compounding errors
