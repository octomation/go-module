---
code: null
id: MDU6SXNzdWU5ODg1Mzk1NzA=
databaseId: 988539570
number: 13
url: https://github.com/octomation/go-module/issues/13
title: "extend travis encrypt example"
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
createdAt: 2021-09-05T15:49:24Z
updatedAt: 2022-08-11T10:29:00Z
lastEditedAt: null
closedAt: 2021-09-05T15:54:24Z
---

# extend travis encrypt example

```bash
$ git config slack.channel octolab:secret
$ travis encrypt "$(git config slack.channel)" --add notifications.slack --com
```
