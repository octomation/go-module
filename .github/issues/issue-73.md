---
id: 73
database_id: 1446767978
node_id: I_kwDOC16TM85WO-1q
status: closed
title: "ci/cd: setup cache"
labels: ["type: improvement","scope: inventory","impact: medium","effort: easy"]
url: https://github.com/octomation/go-module/issues/73
created_at: 2022-11-13T06:55:04Z
updated_at: 2023-03-13T13:49:00Z
---

# ci/cd: setup cache

**Motivation:** increase build speed.

See the docs
- https://docs.github.com/en/actions/using-workflows/caching-dependencies-to-speed-up-workflows
- https://github.com/actions/cache/blob/main/examples.md#go---modules

Also, add workflow to drop all caches, see
- https://stackoverflow.com/questions/63521430/clear-cache-in-github-actions
- https://github.blog/changelog/2022-06-27-list-and-delete-caches-in-your-actions-workflows/
