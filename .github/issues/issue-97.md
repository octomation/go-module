---
id: 97
database_id: 1630174816
node_id: I_kwDOC16TM85hKn5g
status: closed
title: "dev: add setup target"
labels: ["type: feature","scope: inventory","impact: medium","effort: medium"]
url: https://github.com/octomation/go-module/issues/97
created_at: 2023-03-18T05:31:17Z
updated_at: 2023-04-06T19:40:59Z
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
