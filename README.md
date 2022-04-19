> # 🧩 Module
>
> Template for typical module written on Go.

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

### The structure

- `.github/workflows` — [GitHub Actions][docs.actions] pipelines.

### Build your own module

1. [Generate][action.generate] a new repository from the template.
2. Clone the repository.
3. Update files
   - `README.md`,
   - `go.mod`.
4. Write your code and tests.

### Contribute to the template

1. [Fork][action.fork] the repository.

## 🧩 Integration

The project uses [SemVer][docs.semver] for versioning, and it is not
[BC][wiki.compat]-safe through major releases.
Please use [go modules][wiki.gomod] to manage its version.

```bash
$ go get go.octolab.org@latest
```

## 🤲 Outputs & outcomes

...

<p align="right">made with ❤️ for everyone</p>

[build.page]:       https://github.com/octomation/go-module/actions/workflows/ci.yml
[build.icon]:       https://github.com/octomation/go-module/actions/workflows/ci.yml/badge.svg
[coverage.page]:    https://codecov.io/gh/octomation/go-module
[coverage.icon]:    https://codecov.io/gh/octomation/go-module/branch/main/graph/badge.svg
[site.page]:        https://go-module.octolab.org
[site.icon]:        https://img.shields.io/badge/site-go--module.octolab.org-brightgreen
[docs.page]:        https://pkg.go.dev/go.octolab.org
[docs.icon]:        https://img.shields.io/badge/docs-pkg.go.dev-blue
[mirror.page]:      https://bitbucket.org/kamilsk/go-module
[mirror.icon]:      https://img.shields.io/badge/mirror-bitbucket-blue
[template.page]:    https://github.com/octomation/go-module
[template.icon]:    https://img.shields.io/badge/template-go--module-blue

[action.fork]:      https://github.com/octomation/go-module/fork
[action.generate]:  https://github.com/octomation/go-module/generate
[docs.actions]:     https://docs.github.com/en/actions
[docs.semver]:      https://semver.org
[wiki.compat]:      https://en.wikipedia.org/wiki/Backward_compatibility
[wiki.gomod]:       https://github.com/golang/go/wiki/Modules
