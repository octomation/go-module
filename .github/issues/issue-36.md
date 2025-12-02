---
id: 36
database_id: 1260247801
node_id: I_kwDOC16TM85LHdr5
status: closed
title: "ci/cd: run simple go fmt on ci stage"
labels: []
url: https://github.com/octomation/go-module/issues/36
created_at: 2022-06-03T18:48:41Z
updated_at: 2022-08-11T10:28:47Z
---

# ci/cd: run simple go fmt on ci stage

**Motivation:** `pre-push` can handle unformatted code, but it doesn't start at the `checking` stage, because there are no `goimports` and other tools.

For example

- works well https://github.com/octomation/maintainer/actions/runs/2436302897
- but https://github.com/octomation/maintainer/commit/fc48373bcb4d1a5f6dbc4f78e7b45ecbc96bc2e2 doesn't contain 
```
diff --git a/internal/command/github/view/diff.go b/internal/command/github/view/diff.go
index 8c19d61..b584cae 100644
--- a/internal/command/github/view/diff.go
+++ b/internal/command/github/view/diff.go
@@ -2,6 +2,7 @@ package view
 
 import (
        "fmt"
+
        "github.com/alexeyco/simpletable"
```
