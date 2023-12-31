---
code: null
id: I_kwDOC16TM850FIqP
databaseId: 1947503247
number: 171
url: https://github.com/octomation/go-module/issues/171
title: "ci/cd: docs workflow doesn't work properly for non-custom github pages domain"
issueType: null
labels:
  - "type: bug"
  - "severity: critical"
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
createdAt: 2023-10-17T13:58:20Z
updatedAt: 2023-10-17T20:44:35Z
lastEditedAt: null
closedAt: null
---

# ci/cd: docs workflow doesn't work properly for non-custom github pages domain

The default host looks like `<owner>.github.io/<repo>`, but pages contain `href="/_next/static/css/..."`, so it tries to load the source from `<owner>.github.io/_next`, not `<owner>.github.io/<repo>/_next`.

<!-- 2023-10-17T15:14Z https://github.com/octomation/go-module/issues/171#issuecomment-1766628636
- quick fix https://github.com/withsparkle/service/commit/1c9c9a9341a72c1d902fe88e05f293f5356b1ee4
-->

<!-- 2023-10-17T20:44Z https://github.com/octomation/go-module/issues/171#issuecomment-1767147831
finally
- https://github.com/withsparkle/service/blob/f9aee3527f02981bbb69aa688955ed495ae4bad1/.github/workflows/cd.docs.yml#L48-L57
- https://github.com/withsparkle/service/blob/f9aee3527f02981bbb69aa688955ed495ae4bad1/.github/workflows/ci.yml#L94-L100
-->
