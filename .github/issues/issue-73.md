---
code: null
id: I_kwDOC16TM85WO-1q
databaseId: 1446767978
number: 73
url: https://github.com/octomation/go-module/issues/73
title: "ci/cd: setup cache"
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
createdAt: 2022-11-13T06:55:04Z
updatedAt: 2023-03-13T13:49:00Z
lastEditedAt: 2023-01-11T06:18:26Z
closedAt: 2023-03-13T13:48:59Z
---

# ci/cd: setup cache

**Motivation:** increase build speed.

See the docs
- https://docs.github.com/en/actions/using-workflows/caching-dependencies-to-speed-up-workflows
- https://github.com/actions/cache/blob/main/examples.md#go---modules

Also, add workflow to drop all caches, see
- https://stackoverflow.com/questions/63521430/clear-cache-in-github-actions
- https://github.blog/changelog/2022-06-27-list-and-delete-caches-in-your-actions-workflows/
