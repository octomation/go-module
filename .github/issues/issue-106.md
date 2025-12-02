---
id: 106
database_id: 1672933098
node_id: I_kwDOC16TM85jtu7q
status: closed
title: "dev: maintainer and module renaming"
labels: ["type: feature","scope: code","scope: inventory","impact: high","effort: medium","scope: deps"]
url: https://github.com/octomation/go-module/issues/106
created_at: 2023-04-18T11:40:44Z
updated_at: 2023-06-25T08:50:18Z
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
