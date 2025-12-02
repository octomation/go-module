---
id: 98
database_id: 1630178993
node_id: I_kwDOC16TM85hKo6x
status: open
title: "dev: add git flow targets"
labels: ["type: feature","scope: inventory","impact: high","effort: medium","status: pending"]
url: https://github.com/octomation/go-module/issues/98
created_at: 2023-03-18T05:34:46Z
updated_at: 2023-06-02T09:41:16Z
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
