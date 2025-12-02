---
id: 171
database_id: 1947503247
node_id: I_kwDOC16TM850FIqP
status: open
title: "ci/cd: docs workflow doesn't work properly for non-custom github pages domain"
labels: ["type: bug","severity: critical","scope: docs","scope: inventory","impact: medium","effort: easy"]
url: https://github.com/octomation/go-module/issues/171
created_at: 2023-10-17T13:58:20Z
updated_at: 2023-10-17T20:44:35Z
---

# ci/cd: docs workflow doesn't work properly for non-custom github pages domain

The default host looks like `<owner>.github.io/<repo>`, but pages contain `href="/_next/static/css/..."`, so it tries to load the source from `<owner>.github.io/_next`, not `<owner>.github.io/<repo>/_next`.
