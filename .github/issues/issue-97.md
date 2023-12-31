---
code: null
id: I_kwDOC16TM85hKn5g
databaseId: 1630174816
number: 97
url: https://github.com/octomation/go-module/issues/97
title: "dev: add setup target"
issueType: null
labels:
  - "type: feature"
  - "scope: inventory"
  - "impact: medium"
  - "effort: medium"
assignees:
  - kamilsk
milestone: "[[milestone-1]]"
parent: null
issueFields: {}
state: CLOSED
stateReason: COMPLETED
duplicateOf: null
createdAt: 2023-03-18T05:31:17Z
updatedAt: 2023-04-06T19:40:59Z
lastEditedAt: 2023-03-18T05:32:55Z
closedAt: 2023-04-06T19:40:59Z
---

# dev: add setup target

**Motivation:** prepare environment.

**Interface**

```bash
$ run setup
# make deps
# make tools
# ...
# run @usage
#  - make test - run some tests...
#  - make lint - run some lints...
#  - ...
```

**To do**

- [ ] Describe `alias run=./Taskfile` in the readme.
- [ ] Add reference to the Taskfile project.
