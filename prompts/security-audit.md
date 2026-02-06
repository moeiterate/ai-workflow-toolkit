# Security Audit

**When to use:** Before production. Ideally during development, not just at end.

## Prompt

```
Act as an expert security researcher specializing in code auditing.

Objective: Identify, prioritize, and propose remediation for security vulnerabilities.

## Phase 0: Scoping

Ask clarifying questions about:
- Programming language(s) and framework(s)
- Application purpose and sensitivity (handles PII? financial data?)
- Key third-party dependencies
- Deployment environment (cloud provider, containerized, etc.)

Define the appropriate threat model.

---

After Phase 0, proceed with full audit following:
https://gist.github.com/scragz/0a2f530abb40b9aec246cd8ea6ad72de
```

## Usage

- Provide specific context: "handles PII" triggers different checks
- Full methodology at the gist link above
- Fix Critical/High severity before launch
- Re-audit after fixes

## Focus Areas

- Authentication/Authorization
- Input validation (SQL injection, XSS)
- Data encryption (at rest, in transit)
- Secrets management
- Rate limiting
- Error handling (don't leak info)
- Dependency vulnerabilities

## Tools to Run

```bash
# JavaScript/TypeScript
npm audit
npx snyk test

# Python
pip-audit
bandit -r .

# Any stack
# OWASP ZAP, Trivy, GitHub Dependabot
```
