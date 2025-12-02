---
id: 79
database_id: 1533710399
node_id: I_kwDOC16TM85bapA_
status: closed
title: "ci/cd: run dependabot on weekends"
labels: ["type: feature","scope: inventory","impact: medium","effort: medium"]
url: https://github.com/octomation/go-module/issues/79
created_at: 2023-01-15T08:05:58Z
updated_at: 2023-10-01T10:00:07Z
---

# ci/cd: run dependabot on weekends

**Motivation:** dependabot runs only on weekdays. See [the docs](https://docs.github.com/en/code-security/dependabot/dependabot-version-updates/configuration-options-for-the-dependabot.yml-file#scheduleinterval).

Related to
- https://github.com/community/community/discussions/15901

**Solution**

Based on https://github.com/dependabot/dependabot-core/issues/2980#issuecomment-760586879.

Under the hood, it calls

```
POST https://github.com/tact-app/web/network/updates?update_config_id={id from the list}
content-type: application/x-www-form-urlencoded

authenticity_token={token}
```

**Notes**

The origin page isn't related to the id, e.g.,
- /tact-app/web/network/updates/578612902
- /tact-app/web/network/updates?update_config_id=14214319

But the id is static 14214319, so, it's possible to store them as secrets.
