---
id: 179
database_id: 1997013924
node_id: I_kwDOC16TM853CAOk
status: open
title: "ci/cd: there is no workflow triggering for dependabot update"
labels: ["type: bug","severity: major","scope: inventory","impact: medium","effort: easy"]
url: https://github.com/octomation/go-module/issues/179
created_at: 2023-11-16T14:39:26Z
updated_at: 2023-11-16T14:39:27Z
---

# ci/cd: there is no workflow triggering for dependabot update

**Details**

#177 is invalid, because x/time set go to 1.18. The module supports go1.11, and this pull must have failed to build, but it doesn't. Anyway, there is no automated start.

- https://github.com/golang/time/releases/tag/v0.4.0
- manually triggered job: https://github.com/octomation/go-module/actions/runs/6892105447

I think this rule is incorrect.

https://github.com/octomation/go-module/blob/22fbca9459561eba60a8915cb10947fe5bbd3a83/.github/workflows/ci.yml#L4-L12
