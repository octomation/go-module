---
code: null
id: I_kwDOC16TM85LlDoT
databaseId: 1268005395
number: 41
url: https://github.com/octomation/go-module/issues/41
title: "deps: tools: add git-vertag"
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
createdAt: 2022-06-10T20:34:56Z
updatedAt: 2022-08-11T10:28:48Z
lastEditedAt: null
closedAt: 2022-07-30T20:40:44Z
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

<!-- 2022-07-30T20:40Z https://github.com/octomation/go-module/issues/41#issuecomment-1200290495
moved to kamilsk/dotfiles/issues/367
-->
