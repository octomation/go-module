---
id: 514
database_id: 4759170328
node_id: I_kwDOC16TM88AAAABG6stGA
status: open
title: "ci/cd: dependabot npm updates fail with private_registry_config_not_found for npm.pkg.github.com"
labels: ["type: bug","severity: major","scope: docs","scope: inventory","impact: medium","effort: easy"]
url: https://github.com/octomation/go-module/issues/514
created_at: 2026-06-27T16:51:39Z
updated_at: 2026-06-27T16:51:39Z
---

# ci/cd: dependabot npm updates fail with private_registry_config_not_found for npm.pkg.github.com

**Details**

Since `2026-06-23` all npm Dependabot updates for `/docs` fail at the file-fetching stage, before any dependency is resolved:

```
ERROR Private npm registries require either a .npmrc file in your repository,
or explicit `scope`/`replaces-base` configuration in dependabot.yml.
Registry: npm.pkg.github.com
```
```
private_registry_config_not_found  { "source": "npm.pkg.github.com" }
```

**Root cause:** GitHub rolled out automatic Dependabot access to GitHub-hosted registries. Dependabot now injects an `npm.pkg.github.com` credential into every job (`automatic-github-packages-auth: true`), even for repos that don't use GitHub Packages — every dependency in `/docs` (`next`, `nextra`, `react`, …) is a public `registry.npmjs.org` package. For the npm ecosystem this auto-auth requires a `.npmrc` checked into the repo; without it (and without `scope`/`replaces-base`) the updater aborts. `gomod` and `github-actions` ecosystems are unaffected — only npm in `/docs`.

Observed in downstream `lifeosm/indexit`, but the cause is the shared template config here:

https://github.com/octomation/go-module/blob/main/.github/dependabot.yml#L34-L45

**Fix:** add a minimal `.npmrc` pinning the public registry (we don't use GitHub Packages):

```ini
# docs/.npmrc
registry=https://registry.npmjs.org/
```

Alternative — declare the registry explicitly in `dependabot.yml` with `replaces-base: false` and reference it from the npm update. The `.npmrc` is simpler and repo-local, no secrets required.

**Sources**

- https://github.blog/changelog/2026-06-23-automatic-dependabot-access-to-github-hosted-registries/
- https://docs.github.com/en/code-security/dependabot/working-with-dependabot/configuring-access-to-private-registries-for-dependabot
- https://docs.github.com/en/code-security/dependabot/working-with-dependabot/guidance-for-the-configuration-of-private-registries-for-dependabot
