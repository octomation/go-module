---
code: null
id: I_kwDOC16TM85oozDu
databaseId: 1755525358
number: 130
url: https://github.com/octomation/go-module/issues/130
title: "ci/cd: disable some actions by default"
issueType: null
labels:
  - "type: improvement"
  - "scope: docs"
  - "scope: inventory"
  - "impact: medium"
  - "effort: easy"
assignees:
  - kamilsk
milestone: "[[milestone-2]]"
parent: null
issueFields: {}
state: OPEN
stateReason: null
duplicateOf: null
createdAt: 2023-06-13T19:27:28Z
updatedAt: 2023-06-18T19:43:02Z
lastEditedAt: null
closedAt: null
---

# ci/cd: disable some actions by default

**Motivation:** a created from the template repository has broken builds, e.g.,

<img width="513" alt="image" src="https://github.com/octomation/go-module/assets/1165416/d694d13f-ac17-4161-b5b5-e6b45ce2d72f">

**Proof of concept**

```
ENABLED_ACTIONS=(
  caches
  cd
  ci
  deps
  docs <- failed from scratch
  runs
  stale
  tools
)
# or
ENABLED_ACTIONS=[caches,...,tools]
```

Use `contains` https://docs.github.com/en/actions/learn-github-actions/expressions#contains.

<!-- 2023-06-14T10:35Z https://github.com/octomation/go-module/issues/130#issuecomment-1590939364
The alternative is to provide more convenient messages to handle failed builds.
-->

<!-- 2023-06-18T19:43Z https://github.com/octomation/go-module/issues/130#issuecomment-1596247393
https://github.com/actions/configure-pages/blob/f156874f8191504dae5b037505266ed5dda6c382/action.yml#L18-L19

```
Run actions/configure-pages@v3
  with:
    token: ***
    enablement: false
Error: Get Pages site failed. Please verify that the repository has Pages enabled and configured to build using GitHub Actions, or consider exploring the `enablement` parameter for this action.
Error: HttpError: Not Found
```
-->
