[![Go Module][social.preview]][preview.config]

# 🧩 Module

GitHub Actions workflows.

✅ Slack notification is available for all workflows.
Just add `SLACK_WEBHOOK` secret to your repository.

## [Cache invalidation](caches.yml)

[![Status][caches.icon]][caches.page]

Invalidates caches of GitHub Actions workflows.
Read more about caches https://docs.github.com/en/actions/using-workflows/caching-dependencies-to-speed-up-workflows.


## [Continuous delivery](cd.yml)

[![Status][cd.icon]][cd.page]

🚧 Experimental feature, still under development.
Supports canonical import path.


## [Continuous integration](ci.yml)

[![Status][ci.icon]][ci.page]

Runs linter and tests on different Go environments.


## [Dependabot at weekends](deps.yml)

[![Status][deps.icon]][deps.page]

🚧 Experimental feature, still under development. Read more

- https://github.com/orgs/community/discussions/15901
- https://github.com/dependabot/dependabot-core/issues/2980#issuecomment-760586879
- https://github.com/octomation/go-module/issues/79
- https://github.com/dependabot/cli
- https://github.com/github/dependabot-action

⚠️ Required:

- `DEPENDABOT_TOKEN`, GitHub personal access tokens with scope: gist.


## [Documentation delivery](docs.yml)

[![Status][docs.icon]][docs.page]

Builds and deploys documentation to GitHub Pages.
[💬 Discussion](https://github.com/under-the-hood/docs/discussions/2).


## [Workflow invalidation](runs.yml)

[![Status][runs.icon]][runs.page]

⚠️ Removes old workflow runs. Please, use it carefully.


## [Issue invalidation](stale.yml)

[![Status][stale.icon]][stale.page]

Checks for stale issues and pull requests.


## [Tools validation](tools.yml)

[![Status][tools.icon]][tools.page]

Checks tools for consistency.

<p align="right">made with ❤️ for everyone by <a href="https://www.octolab.org/">OctoLab</a></p>

[social.preview]:   https://cdn.octolab.org/repo/go-module.png
[preview.config]:   https://socialify.git.ci/octomation/go-module?description=1&font=Raleway&language=1&name=1&owner=1&pattern=Circuit%20Board&theme=Light
[preview.fallback]: https://socialify.git.ci/octomation/go-module/image?description=1&font=Raleway&language=1&name=1&owner=1&pattern=Circuit%20Board&theme=Light

[caches.icon]:      https://github.com/octomation/go-module/actions/workflows/caches.yml/badge.svg
[caches.page]:      https://github.com/octomation/go-module/actions/workflows/caches.yml
[cd.icon]:          https://github.com/octomation/go-module/actions/workflows/cd.yml/badge.svg
[cd.page]:          https://github.com/octomation/go-module/actions/workflows/cd.yml
[ci.icon]:          https://github.com/octomation/go-module/actions/workflows/ci.yml/badge.svg
[ci.page]:          https://github.com/octomation/go-module/actions/workflows/ci.yml
[deps.icon]:        https://github.com/octomation/go-module/actions/workflows/deps.yml/badge.svg
[deps.page]:        https://github.com/octomation/go-module/actions/workflows/deps.yml
[docs.icon]:        https://github.com/octomation/go-module/actions/workflows/docs.yml/badge.svg
[docs.page]:        https://github.com/octomation/go-module/actions/workflows/docs.yml
[runs.icon]:        https://github.com/octomation/go-module/actions/workflows/runs.yml/badge.svg
[runs.page]:        https://github.com/octomation/go-module/actions/workflows/runs.yml
[stale.icon]:       https://github.com/octomation/go-module/actions/workflows/stale.yml/badge.svg
[stale.page]:       https://github.com/octomation/go-module/actions/workflows/stale.yml
[tools.icon]:       https://github.com/octomation/go-module/actions/workflows/tools.yml/badge.svg
[tools.page]:       https://github.com/octomation/go-module/actions/workflows/tools.yml
