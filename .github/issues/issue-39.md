---
id: 39
database_id: 1265231319
node_id: I_kwDOC16TM85LaeXX
status: closed
title: "deps: tools: add gorename"
labels: []
url: https://github.com/octomation/go-module/issues/39
created_at: 2022-06-08T19:58:38Z
updated_at: 2022-08-11T10:28:48Z
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
