---
code: null
id: I_kwDOC16TM88AAAABTBPW1A
databaseId: 5571335892
number: 546
url: https://github.com/octomation/go-module/issues/546
title: "ci/cd: keep tools updated by Dependabot after the go tool migration"
issueType: null
labels:
  - "type: improvement"
  - "scope: inventory"
  - "status: pending"
  - "scope: deps"
assignees:
  - kamilsk
milestone: null
parent: null
issueFields: {}
state: OPEN
stateReason: null
duplicateOf: null
createdAt: 2026-09-24T16:23:36Z
updatedAt: 2026-09-24T16:23:37Z
lastEditedAt: null
closedAt: null
---

# ci/cd: keep tools updated by Dependabot after the go tool migration

# ci/cd: keep tools updated by Dependabot after the go tool migration

**Motivation:** the `tool` directive ([[issue-389]]) requires every tool module as `// indirect`, and Dependabot version updates skip indirect Go modules by default: the parser gives them no requirements and the default `dependency-type` is `direct`. After the migration tools silently stop receiving update PRs.

Upstream: dependabot/dependabot-core#12050 — "Support Go tool dependencies", open since 2025-04-14, no replies as of 2026-09-24.

## Known workarounds

- An `allow` list naming each tool module with `dependency-type: all`. It works but duplicates the `tool` block of `tools/go.mod` in `dependabot.yml`, and the two must be kept in sync by hand. One project went as far as a lint rule that flags a tool module without a covering `allow` entry: TomHennen/wrangle#850 (context: TomHennen/wrangle#841). Rejected here for that coupling.
- Renovate: go tool support is discussed in renovatebot/renovate#33867; switching would be a separate decision.

## Current stopgap (octopot/indexit)

- The `/tools/` gomod entry keeps `open-pull-requests-limit: 0`, the documented way to disable version updates; security updates are a separate mechanism and are not subject to that limit.
- Tools are updated by hand with `make go-tools-update`, which now runs `go get tool`.

## Done when

- Dependabot raises version-update PRs for modules listed in the `tool` directive without naming them anywhere else, or an equally decoupled alternative is chosen; then re-enable the `/tools/` entry in the template and in dependent repositories.
