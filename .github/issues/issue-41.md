---
id: 41
database_id: 1268005395
node_id: I_kwDOC16TM85LlDoT
status: closed
title: "deps: tools: add git-vertag"
labels: []
url: https://github.com/octomation/go-module/issues/41
created_at: 2022-06-10T20:34:56Z
updated_at: 2022-08-11T10:28:48Z
---

# deps: tools: add git-vertag

**Motivation:** it allows to extend the `gorelease` experience.

```bash
$  git-vertag get
v0.0.7
```

```go

//go:build tools

package tools

import (
	_ "github.com/kyoh86/git-vertag"
)

//go:generate go install github.com/kyoh86/git-vertag
```
