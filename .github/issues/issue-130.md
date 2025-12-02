---
id: 130
database_id: 1755525358
node_id: I_kwDOC16TM85oozDu
status: open
title: "ci/cd: disable some actions by default"
labels: ["type: improvement","scope: docs","scope: inventory","impact: medium","effort: easy"]
url: https://github.com/octomation/go-module/issues/130
created_at: 2023-06-13T19:27:28Z
updated_at: 2023-06-18T19:43:02Z
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
