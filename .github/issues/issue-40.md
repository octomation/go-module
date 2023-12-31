---
code: null
id: I_kwDOC16TM85Laeir
databaseId: 1265232043
number: 40
url: https://github.com/octomation/go-module/issues/40
title: "deps: tools: add marwan-at-work/mod"
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
createdAt: 2022-06-08T19:59:30Z
updatedAt: 2022-08-11T10:28:48Z
lastEditedAt: null
closedAt: 2022-07-30T20:39:47Z
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

<!-- 2022-07-30T20:39Z https://github.com/octomation/go-module/issues/40#issuecomment-1200290384
moved to kamilsk/dotfiles/issues/366
-->
