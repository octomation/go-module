[![Go Module][social.preview]][preview.config]

[![Coverage][coverage.icon]][coverage.page]
[![Quality][quality.icon]][quality.page]
[![Documentation][docs.icon]][docs.page]
[![CI/CD][build.icon]][build.page]
[![Promo][site.icon]][site.page]
[![Mirror][mirror.icon]][mirror.page]
[![Template][template.icon]][template.page]

# 🧩 Module [![awesome.icon]][awesome.page]

Template for a typical module written on Go.

## 🛫 Quick start

<details>
  <summary>Work with Makefile</summary>

```bash
$ make setup
$ make help

$ make find-todos
$ make test lint
$ TIMEOUT=5s make test-with-coverage
```

</details>
<details>
  <summary>Work with Taskfile</summary>

```bash
$ alias run=./Taskfile
$ run help

$ run docs # === `run docs install -- build -- start`
$ run docs npm ci
$ run docs npm i nextra@latest

$ run tools go generate tools.go
$ run tools golangci-lint --version -- mockgen --version
$ run which goimports golangci-lint govulncheck mockgen
```

</details>
<details>
  <summary>Work with Tools</summary>

```bash
$ make tools
$ source bin/activate

$ which goimports
$ goimports -local $(go list -m) -w ./...
```

</details>
<details>
  <summary>Work with Docker</summary>

```bash
$ make go-1.11 # or go-1.12, etc.
/src# make go-env 2>/dev/null | grep GOVERSION
# GOVERSION:   1.11.13
/src# make test
```

</details>

## 💡 Idea

Define a powerful template that quickly creates a new Go module.
Not only does it provide a starting point for new projects,
but it comes equipped with pre-configured ci/cd and inventory.

## 🏆 Motivation

At [OctoLab][octolab.site], we want to start new projects faster using best practices
with a predefined structure and focusing on core ideas implementation
rather than wasting time on environment configuration and copying boilerplate code.

## 🤼‍ How to

### Build your own module

1. [Generate][action.generate] a new repository from the template.
2. Clone the repository locally.
3. Update the desired files as needed.
4. Write your code and tests.
5. 🚀

### Contribute to the template

1. Read the [contribution guidelines][docs.contrib].
2. [Fork][action.fork] the repository.
3. Make your changes.
4. Send a pull request.
5. 🤗

Before you start, please make sure your changes are in demand.
The best for that is to create [a new discussion][action.discuss],
or if you find an issue, [report it][action.issue] first.

## 🎛️ Configuration

### Pre-configured

1. [GitHub Actions](https://github.com/features/actions).
2. [GitHub Pages](https://pages.github.com).
3. [Dependabot](https://github.com/dependabot).

### Included

1. [Nextra](https://nextra.site).
2. [Makefiles](https://github.com/octomation/makefiles).
3. [Taskfiles](https://github.com/octomation/taskfiles).
4. [Go tools][egg]: [mockgen][], [golangci-lint][],
   [goimports][], [govulncheck][].

[mockgen]:          https://github.com/golang/mock
[govulncheck]:      https://github.com/golang/vuln
[egg]:              https://github.com/kamilsk/egg
[goimports]:        https://github.com/kamilsk/go-tools
[golangci-lint]:    https://github.com/kamilsk/golangci-lint

### Optional

1. [Bitbucket](https://bitbucket.org)[^1].
2. [Codecov](https://about.codecov.io).
3. [Slack](https://github.com/marketplace/slack-github).
4. [Settings](https://github.com/apps/settings).
5. [Go Report Card](https://goreportcard.com).
6. [Shields.io](https://shields.io).
7. [GitHub Socialify](https://socialify.git.ci).

[^1]: An alternative for backup could be [GitLab](https://about.gitlab.com),
[Gogs](https://gogs.io), or [Gitea](https://gitea.io).

### Coming soon

1. [CodeQL](https://codeql.github.com) (code scanning).
2. [Graphite](https://graphite.dev) (git workflow).
3. [Qodana](https://qodana.cloud) (code quality).
4. [SonarCloud](https://sonarcloud.io) (code quality).
5. [Vanity URL](https://github.com/octomation/vanity) (canonical import path).
6. [Vercel](https://vercel.com) (docs preview).

## 🛬 Integration

The project uses [SemVer](https://semver.org) for versioning, and it is not
[BC][wiki.compat]-safe through major releases.
Please use [Go Modules][wiki.gomod] to manage its version.

```bash
$ go get go.octolab.org@latest
```

## 🏗️ Ecosystem

### Input

- https://github.com/kamilsk/retry
- https://github.com/kamilsk/semaphore
- https://github.com/kamilsk/tracer
- https://github.com/octolab/breaker

### Impact

- https://github.com/octomation/go-tool
- https://github.com/octomation/maintainer
- https://github.com/octomation/makefiles
- https://github.com/octomation/taskfiles
- https://github.com/octomation/vanity

### Output

- https://github.com/octolab/cli*
- https://github.com/octolab/config
- https://github.com/octolab/pkg*
- https://github.com/octolab/propaganda
- https://github.com/octolab/protocol*

<p align="right">made with ❤️ for everyone by OctoLab</p>

[social.preview]:   https://socialify.git.ci/octomation/go-module/image?description=1&font=Raleway&language=1&name=1&owner=1&pattern=Circuit%20Board&theme=Light
[preview.config]:   https://socialify.git.ci/octomation/go-module?description=1&font=Raleway&language=1&name=1&owner=1&pattern=Circuit%20Board&theme=Light
[preview.fallback]: https://repository-images.githubusercontent.com/190747443/299e9ada-7893-4eba-8cc0-9a29d3c53b83

[awesome.icon]:     https://awesome.re/mentioned-badge.svg
[awesome.page]:     https://awesome-go.com/project-layout/
[coverage.icon]:    https://codecov.io/gh/octomation/go-module/branch/main/graph/badge.svg
[coverage.page]:    https://codecov.io/gh/octomation/go-module
[quality.icon]:     https://goreportcard.com/badge/go.octolab.org/template/module
[quality.page]:     https://goreportcard.com/report/go.octolab.org/template/module
[docs.icon]:        https://pkg.go.dev/badge/go.octolab.org/template/module.svg
[docs.page]:        https://pkg.go.dev/go.octolab.org/template/module
[build.icon]:       https://img.shields.io/badge/ci%2Fcd-GitHub%20Actions-brightgreen
[build.page]:       https://github.com/octomation/go-module/actions
[site.icon]:        https://img.shields.io/badge/site-GitHub%20Pages-brightgreen
[site.page]:        https://go-module.octolab.org
[mirror.icon]:      https://img.shields.io/badge/mirror-Bitbucket-blue
[mirror.page]:      https://bitbucket.org/kamilsk/go-module
[template.icon]:    https://img.shields.io/badge/template-go--module-blue
[template.page]:    https://github.com/octomation/go-module

[action.discuss]:   https://github.com/octomation/go-module/discussions/new/choose
[action.fork]:      https://github.com/octomation/go-module/fork
[action.generate]:  https://github.com/octomation/go-module/generate
[action.issue]:     https://github.com/octomation/go-module/issues/new/choose
[docs.contrib]:     https://github.com/octomation/.github/blob/main/.github/CONTRIBUTING.md
[octolab.site]:     https://github.com/octolab
[wiki.compat]:      https://en.wikipedia.org/wiki/Backward_compatibility
[wiki.gomod]:       https://github.com/golang/go/wiki/Modules
