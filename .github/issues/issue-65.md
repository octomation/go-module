---
code: null
id: I_kwDOC16TM85TlfcW
databaseId: 1402337046
number: 65
url: https://github.com/octomation/go-module/issues/65
title: "ci/cd: dependabot: change commit message"
issueType: null
labels:
  - "type: improvement"
  - "scope: inventory"
  - "impact: medium"
  - "effort: easy"
assignees:
  - kamilsk
milestone: "[[milestone-1]]"
parent: null
issueFields: {}
state: CLOSED
stateReason: COMPLETED
duplicateOf: null
createdAt: 2022-10-09T17:10:18Z
updatedAt: 2023-10-01T10:00:05Z
lastEditedAt: null
closedAt: 2022-10-12T09:32:50Z
---

# ci/cd: dependabot: change commit message

**Motivation:** to be precise.

- `directory: /` -> `deps:`
- `directory: /docs/` -> `deps: docs:` or `docs: deps:`
- `directory: /tools/` -> `deps: tools:` or `tools: deps:`
- `github-actions` -> `deps: ci/cd:` or `ci/cd: deps:`

See the docs https://docs.github.com/en/code-security/dependabot/dependabot-version-updates/configuration-options-for-the-dependabot.yml-file#commit-message.
Don't forget about https://www.conventionalcommits.org/en/v1.0.0/.
