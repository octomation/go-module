---
id: 40
database_id: 1265232043
node_id: I_kwDOC16TM85Laeir
status: closed
title: "deps: tools: add marwan-at-work/mod"
labels: []
url: https://github.com/octomation/go-module/issues/40
created_at: 2022-06-08T19:59:30Z
updated_at: 2022-08-11T10:28:48Z
---

# deps: tools: add marwan-at-work/mod

**Motivation:** it allows to update a major version of a dependency.

```bash
$  mod upgrade --mod-name=github.com/google/go-github/v44
# update it to v45
```

```go

//go:build tools

package tools

import (
	_ "github.com/marwan-at-work/mod/cmd/mod"
)

//go:generate go install github.com/marwan-at-work/mod/cmd/mod
```
