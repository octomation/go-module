---
code: null
id: I_kwDOC16TM85hKo6x
databaseId: 1630178993
number: 98
url: https://github.com/octomation/go-module/issues/98
title: "dev: add git flow targets"
issueType: null
labels:
  - "type: feature"
  - "scope: inventory"
  - "impact: high"
  - "effort: medium"
  - "status: pending"
assignees:
  - kamilsk
milestone: "[[milestone-2]]"
parent: null
issueFields: {}
state: OPEN
stateReason: null
duplicateOf: null
createdAt: 2023-03-18T05:34:46Z
updatedAt: 2023-06-02T09:41:16Z
lastEditedAt: null
closedAt: null
---

# dev: add git flow targets

**Motivation:** port best practices from my dotfiles.

**Interface**

```bash
$ run git pull
# git stash
# git fetch
# git pull --rebase
# run something to update env, e.g. make tools if checksum has changed
```

<!-- 2023-06-02T09:41Z https://github.com/octomation/go-module/issues/98#issuecomment-1573449523
blocked by #125
-->
