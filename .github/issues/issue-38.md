---
code: null
id: I_kwDOC16TM85LaeRT
databaseId: 1265230931
number: 38
url: https://github.com/octomation/go-module/issues/38
title: "deps: tools: add gomvpkg"
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
createdAt: 2022-06-08T19:58:12Z
updatedAt: 2022-08-11T10:28:48Z
lastEditedAt: null
closedAt: 2022-07-30T20:38:06Z
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

<!-- 2022-07-30T20:38Z https://github.com/octomation/go-module/issues/38#issuecomment-1200290147
moved to kamilsk/dotfiles/issues/364
-->
