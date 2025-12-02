---
id: 37
database_id: 1265230531
node_id: I_kwDOC16TM85LaeLD
status: closed
title: "deps: tools: add benchcmp"
labels: []
url: https://github.com/octomation/go-module/issues/37
created_at: 2022-06-08T19:57:44Z
updated_at: 2022-08-11T10:28:47Z
---

# deps: tools: add benchcmp

**Motivation:** it allows to test performance.

```bash
$ go test -run=NONE -bench=. > [old,new].txt
$  benchcmp old.txt new.txt
```

```go

//go:build tools

package tools

import (
	_ "golang.org/x/tools/cmd/benchcmp"
)

//go:generate go install golang.org/x/tools/cmd/benchcmp
```
