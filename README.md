![Go Module][social.image]

> # 🧩 Module
>
> Template for a typical module written on Go.

[![Build][build.icon]][build.page]
[![Coverage][coverage.icon]][coverage.page]
[![Promo][site.icon]][site.page]
[![Documentation][docs.icon]][docs.page]
[![Mirror][mirror.icon]][mirror.page]
[![Template][template.icon]][template.page]

## 💡 Idea

Define a powerful template that enables us to easily create a new Go module from scratch.
Not only does it provide a starting point for our projects,
but it also comes equipped with pre-configured pipelines and inventory.

## 🏆 Motivation

We want to start new projects quickly using best practices
with a predefined structure and focusing on core ideas implementation
rather than wasting time on environment configuration and copying boilerplate code.

## 🤼‍♂️ How to

The template saves us a lot of time and effort by streamlining the setup process,
allowing us to focus on the essential aspects of our ideas.

### Build your own module

1. [Generate][action.generate] a new repository from the template.
2. Clone the repository.
3. Update files:
    - `tools/pages/*`, `tools/*.jsx?`, `docs/*`.
4. Write your code and tests.

### Contribute to the template

1. Read our [contribution guidelines][docs.contrib].
2. [Fork][action.fork] the repository.
3. Make your changes.
4. Send a pull request.

### Template

```bash {1,4}
$ make setup

$ alias run=./Taskfile
$ run docs
```

The project uses [SemVer](https://semver.org) for versioning, and it is not
[BC][wiki.compat]-safe through major releases.
Please use [Go Modules][wiki.gomod] to manage its version.

```bash
$ go get go.octolab.org@latest
```

## 🎛️ Configuration

### Pre-configured

1. [GitHub Actions](https://github.com/features/actions).
2. [GitHub Pages](https://pages.github.com).
3. [Dependabot](https://github.com/dependabot).

### Included

1. [Nextra](https://nextra.site).
2. [Makefiles](https://github.com/octomation/makefiles).
3. [Taskfiles](https://github.com/octomation/taskfiles).
4. Go tools:
    - [mockgen](https://github.com/golang/mock)
    - [golangci-lint](https://github.com/kamilsk/golangci-lint)
    - [goimports](https://github.com/kamilsk/go-tools)
    - [govulncheck](https://github.com/golang/vuln)

### Optional

1. [Codecov](https://about.codecov.io).
2. [Slack](https://github.com/marketplace/slack-github).
3. [Settings](https://github.com/apps/settings).

### In touch

1. [Docker](https://www.docker.com).
   ```bash
   $ make go-1.11 # or go-1.12, etc.
   /src# make go-env 2>/dev/null | grep GOVERSION
   # GOVERSION:   1.11.13
   /src# make test
   ```
2. (coming soon) [Vercel](https://vercel.com).<!-- TODO:feat:v1.1.0 add vercel cli,  -->

Read more [here][docs.setup].

## 🤲 Outputs & outcomes

<details>
  <summary>OctoLab</summary>

- https://github.com/octolab/breaker*
- https://github.com/octolab/cli*
- https://github.com/octolab/config
- https://github.com/octolab/pkg*
- https://github.com/octolab/propaganda
- https://github.com/octolab/protocol*

</details>
<details>
  <summary>Octomation</summary>

- https://github.com/octomation/dna*
- https://github.com/octomation/go-tool*
- https://github.com/octomation/go-service*

</details>
<details>
  <summary>Others</summary>

- https://github.com/kamilsk/retry*
- https://github.com/kamilsk/semaphore*
- https://github.com/kamilsk/tracer*

</details>

<p align="right">made with ❤️ for everyone</p>

[build.page]:        https://github.com/octomation/go-module/actions/workflows/ci.yml
[build.icon]:        https://github.com/octomation/go-module/actions/workflows/ci.yml/badge.svg
[coverage.page]:     https://codecov.io/gh/octomation/go-module
[coverage.icon]:     https://codecov.io/gh/octomation/go-module/branch/main/graph/badge.svg
[site.page]:         https://go-module.octolab.org
[site.icon]:         https://img.shields.io/badge/site-static-brightgreen
[docs.page]:         https://pkg.go.dev/go.octolab.org
[docs.icon]:         https://img.shields.io/badge/docs-pkg.go.dev-blue
[mirror.page]:       https://bitbucket.org/kamilsk/go-module
[mirror.icon]:       https://img.shields.io/badge/mirror-bitbucket-blue
[template.page]:     https://github.com/octomation/go-module
[template.icon]:     https://img.shields.io/badge/template-go--module-blue

[action.fork]:       https://github.com/octomation/go-module/fork
[action.generate]:   https://github.com/octomation/go-module/generate
[docs.contrib]:      https://github.com/octomation/.github/blob/main/.github/CONTRIBUTING.md
[docs.setup]:        .github/integrations/
[wiki.compat]:       https://en.wikipedia.org/wiki/Backward_compatibility
[wiki.gomod]:        https://github.com/golang/go/wiki/Modules

[awesome.page]:      https://awesome-go.com
[awesome.icon]:      https://awesome.re/mentioned-badge.svg
[social.image]:      https://socialify.git.ci/octomation/go-module/image?description=1&font=Raleway&language=1&name=1&owner=1&pattern=Circuit%20Board&theme=Light
