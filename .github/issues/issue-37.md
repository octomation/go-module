---
code: null
id: I_kwDOC16TM85LaeLD
databaseId: 1265230531
number: 37
url: https://github.com/octomation/go-module/issues/37
title: "deps: tools: add benchcmp"
issueType: null
labels: []
assignees:
  - kamilsk
milestone: "[[milestone-1]]"
parent: null
issueFields: {}
state: CLOSED
stateReason: COMPLETED
duplicateOf: null
createdAt: 2022-06-08T19:57:44Z
updatedAt: 2022-08-11T10:28:47Z
lastEditedAt: null
closedAt: 2022-07-30T20:37:18Z
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

<!-- 2022-07-30T20:37Z https://github.com/octomation/go-module/issues/37#issuecomment-1200290039
moved to kamilsk/dotfiles/issues/363
-->
