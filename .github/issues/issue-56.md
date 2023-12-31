---
code: null
id: I_kwDOC16TM85QHm1D
databaseId: 1344171331
number: 56
url: https://github.com/octomation/go-module/issues/56
title: "ci/cd: replace settings bot by github action"
issueType: null
labels:
  - "type: improvement"
  - "scope: inventory"
  - "impact: medium"
  - "effort: hard"
assignees:
  - kamilsk
milestone: "[[milestone-2]]"
parent: null
issueFields: {}
state: OPEN
stateReason: null
duplicateOf: null
createdAt: 2022-08-19T09:12:25Z
updatedAt: 2023-04-16T12:34:14Z
lastEditedAt: 2023-04-16T12:34:14Z
closedAt: null
---

# ci/cd: replace settings bot by github action

**Motivation:** `settings` is not transparent; debugging and observing it are difficult.

E.g., I did manual fixes for kamilsk/dotfiles/issues/388, removed and attached/detached old labels by new.

<!-- 2022-10-12T09:35Z https://github.com/octomation/go-module/issues/56#issuecomment-1275874596
<img width="931" alt="image" src="https://user-images.githubusercontent.com/1165416/195307257-8d4dfe9e-715d-408c-aa2a-ba82cc6e061b.png">

bad example and extra motivation https://github.com/octomation/go-module/pull/66#issuecomment-1275862595
-->

<!-- 2023-01-11T07:05Z https://github.com/octomation/go-module/issues/56#issuecomment-1378320107
research and try:
- https://github.com/marketplace/actions/github-action-to-run-probot-settings
- https://github.com/repository-settings/app/pull/409
- https://github.com/probot/adapter-github-actions
- https://jasonet.co/posts/probot-app-or-github-action/
- https://github.com/repository-settings
-->

<!-- 2023-01-11T07:11Z https://github.com/octomation/go-module/issues/56#issuecomment-1378323959
related to octomation/settings-action/issues/16
-->
