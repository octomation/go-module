---
id: 13
database_id: 988539570
node_id: MDU6SXNzdWU5ODg1Mzk1NzA=
status: closed
title: "extend travis encrypt example"
labels: []
url: https://github.com/octomation/go-module/issues/13
created_at: 2021-09-05T15:49:24Z
updated_at: 2022-08-11T10:29:00Z
---

# extend travis encrypt example

```bash
$ git config slack.channel octolab:secret
$ travis encrypt "$(git config slack.channel)" --add notifications.slack --com
```
