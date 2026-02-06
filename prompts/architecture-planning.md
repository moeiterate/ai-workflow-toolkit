# Architecture Planning

**When to use:** After finalizing spec. Before writing code.

## Prompt

```
Based on this specification:
[PASTE YOUR SPEC]

Design a system architecture for [TECH STACK]. Include:

1. Database schema (tables, relationships, indexes)
2. API structure (endpoints, methods, authentication)
3. Authentication/authorization strategy
4. File storage solution (if applicable)
5. External service integrations
6. Security considerations
7. Scalability considerations
8. Deployment strategy

Provide text-based diagrams where helpful.
```

## Usage

- Use in Cursor planning mode (or equivalent)
- Be specific: "Next.js 14, Supabase, Vercel" not just "web app"
- Save output as ARCHITECTURE.md

## Next

Choose implementation approach:
- [Step-by-Step](../templates/step-by-step.md) - High control
- [Phase-by-Phase](../templates/phase-by-phase.md) - Balanced
