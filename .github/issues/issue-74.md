---
code: null
id: I_kwDOC16TM85ZLNDB
databaseId: 1496109249
number: 74
url: https://github.com/octomation/go-module/issues/74
title: "ci/cd: fix broken build related to caching"
issueType: null
labels:
  - "type: bug"
  - "severity: critical"
  - "scope: inventory"
  - "impact: high"
  - "effort: easy"
assignees:
  - kamilsk
milestone: "[[milestone-1]]"
parent: null
issueFields: {}
state: CLOSED
stateReason: COMPLETED
duplicateOf: null
createdAt: 2022-12-14T08:59:54Z
updatedAt: 2023-10-01T10:00:06Z
lastEditedAt: null
closedAt: 2023-01-06T15:29:23Z
---

# ci/cd: fix broken build related to caching

See
- https://github.com/octomation/go-module/actions/runs/3693224545
- https://github.com/octomation/go-module/actions/runs/3693224556
- https://github.com/octomation/go-module/actions/runs/3693226503
- https://github.com/octomation/go-module/actions/runs/3693226505

They all related to [[issue-73]] and baef182791ac33da744b63d7453905c0dbbc5a1b
