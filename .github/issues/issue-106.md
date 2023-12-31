---
code: null
id: I_kwDOC16TM85jtu7q
databaseId: 1672933098
number: 106
url: https://github.com/octomation/go-module/issues/106
title: "dev: maintainer and module renaming"
issueType: null
labels:
  - "type: feature"
  - "scope: code"
  - "scope: inventory"
  - "impact: high"
  - "effort: medium"
  - "scope: deps"
assignees:
  - kamilsk
milestone: "[[milestone-2]]"
parent: null
issueFields: {}
state: CLOSED
stateReason: COMPLETED
duplicateOf: null
createdAt: 2023-04-18T11:40:44Z
updatedAt: 2023-06-25T08:50:18Z
lastEditedAt: 2023-04-18T11:42:44Z
closedAt: 2023-06-25T08:50:18Z
---

# dev: maintainer and module renaming

**Motivation:** improve DX to start your own module quicker.

**Details**

Instead of

```markdown
Update files:
- docs/CNAME, tools/pages/*, tools/*.jsx?,
- go.mod, and README.md:
```

Do this

```bash
$ maintainer go mod init github.com/new/owner
```

Also, write notes "How to make your own module", extended version (https://docs.github.com/en/repositories/creating-and-managing-repositories/creating-a-template-repository).

<!-- 2023-04-18T11:41Z https://github.com/octomation/go-module/issues/106#issuecomment-1512931453
blocked by octomation/maintainer/issues/135.
-->

<!-- 2023-06-24T13:12Z https://github.com/octomation/go-module/issues/106#issuecomment-1605483095
Example

```bash
$ make tools
$ go mod edit -module go.octolab.org/ecosystem/tablo
$ find **/*.go -exec sed -i '' "s|go.octolab.org/template/service|go.octolab.org/ecosystem/tablo|g" {} +
$ make format
```
-->
