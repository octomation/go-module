---
id: 38
database_id: 1265230931
node_id: I_kwDOC16TM85LaeRT
status: closed
title: "deps: tools: add gomvpkg"
labels: []
url: https://github.com/octomation/go-module/issues/38
created_at: 2022-06-08T19:58:12Z
updated_at: 2022-08-11T10:28:48Z
---

# deps: tools: add gomvpkg

**Motivation:** it allows to do refactoring.

```bash
$  gomvpkg -from <path>  -to <path>
```

```go

//go:build tools

package tools

import (
	_ "golang.org/x/tools/cmd/gomvpkg"
)

//go:generate go install golang.org/x/tools/cmd/gomvpkg
```
