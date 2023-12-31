---
code: null
id: I_kwDOC16TM85LaeXX
databaseId: 1265231319
number: 39
url: https://github.com/octomation/go-module/issues/39
title: "deps: tools: add gorename"
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
createdAt: 2022-06-08T19:58:38Z
updatedAt: 2022-08-11T10:28:48Z
lastEditedAt: null
closedAt: 2022-07-30T20:38:55Z
---

# deps: tools: add gorename

**Motivation:** it allows to do refactoring.

```bash
$  gorename -from <spec>  -to <spec> -d
  "encoding/json".Decoder.Decode        method of package-level named type
  (*"encoding/json".Decoder).Decode     ditto, alternative syntax
  "encoding/json".Decoder.buf           field of package-level named struct type
  "encoding/json".HTMLEscape            package member (const, func, var, type)
  "encoding/json".Decoder.Decode::x     local object x within a method
  "encoding/json".HTMLEscape::x         local object x within a function
  "encoding/json"::x                    object x anywhere within a package
  json.go::x                            object x within file json.go
```

```go

//go:build tools

package tools

import (
	_ "golang.org/x/tools/cmd/gorename"
)

//go:generate go install golang.org/x/tools/cmd/gorename
```

<!-- 2022-07-30T20:38Z https://github.com/octomation/go-module/issues/39#issuecomment-1200290248
moved to kamilsk/dotfiles/issues/365
-->
