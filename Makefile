# sourced by https://github.com/octomation/makefiles

.DEFAULT_GOAL = check
GIT_HOOKS     = post-merge pre-commit pre-push
GO_VERSIONS   = 1.11 1.12 1.13 1.14 1.15 1.16 1.17 1.18 1.19 1.20 1.21
GO111MODULE   = on

AT    := @
ARCH  := $(shell uname -m | tr '[:upper:]' '[:lower:]')
OS    := $(shell uname -s | tr '[:upper:]' '[:lower:]')
DATE  := $(shell date -u +%Y-%m-%dT%T%Z)
SHELL := /usr/bin/env bash -euo pipefail -c

find-todos:
	$(AT) grep \
		--exclude-dir={bin,docs} \
		--exclude-dir={node_modules,vendor} \
		--exclude-dir={.docz,.next} \
		--color \
		--text \
		-inRo -E ' TODO:.*|SkipNow' . | grep -v ' TODO:.*|SkipNow' || true
.PHONY: find-todos

help:
	@LC_ALL=C $(MAKE) -pRrq -f $(firstword $(MAKEFILE_LIST)) : 2>/dev/null \
	| awk -v RS= -F: '/(^|\n)# Files(\n|$$)/,/(^|\n)# Finished Make data base/ {if ($$1 !~ "^[#.]") {print $$1}}' \
	| sort \
	| egrep -v -e '^[^[:alnum:]]' -e '^$@$$' || true
.PHONY: help

make-verbose:
	$(eval AT :=) $(eval MAKE := $(MAKE) verbose) @true
.PHONY: make-verbose

COMMIT  := $(shell git rev-parse --short --verify HEAD)
RELEASE := $(shell git describe --tags 2>/dev/null | rev | cut -d - -f3- | rev)

git-config:
	$(AT) git config core.autocrlf input
.PHONY: git-config

ifneq (, $(wildcard bin/lib/git/hooks/))
ifdef GIT_HOOKS

git-hooks: git-unhook
	$(AT) for hook in $(GIT_HOOKS); do \
		cp bin/lib/git/hooks/$$hook .git/hooks/; \
	done
.PHONY: git-hooks

git-unhook:
	$(AT) ls .git/hooks \
	| grep -v .sample \
	| sed 's|.*|.git/hooks/&|' \
	| xargs rm -f || true
.PHONY: git-unhook

define hook_tpl
git-$(1):
	$$(AT) bin/lib/git/hooks/$(1)
.PHONY: git-$(1)
endef

render_hook_tpl = $(eval $(call hook_tpl,$(hook)))
$(foreach hook,$(GIT_HOOKS),$(render_hook_tpl))

endif
else
git-hooks:
	@echo have no git hooks
.PHONY: git-hooks

git-unhook: ;
.PHONY: git-unhook
endif

git-clean:
	$(AT) git clean -fdx
.PHONY: git-clean

git-check:
	$(AT) git diff --exit-code >/dev/null
	$(AT) git diff --cached --exit-code >/dev/null
	$(AT) ! git ls-files --others --exclude-standard | grep -q ^
.PHONY: git-check

git-rmdir:
	$(AT) for dir in `git ls-files --others --exclude-standard --directory`; do \
		find $${dir%%/} -depth -type d -empty | xargs rmdir; \
	done
.PHONY: git-rmdir

GOBIN       ?= $(PWD)/bin/$(OS)/$(ARCH)
GOFLAGS     ?= -mod=
GOPRIVATE   ?= go.octolab.net
GOPROXY     ?= direct
GOTEST      ?= $(shell PATH="$(PATH)" command -v testit)
GOTESTFLAGS ?=
GOTRACEBACK ?= all
LOCAL       ?= $(MODULE)
MODULE      ?= `go list $(GOFLAGS)`
PACKAGES    ?= `go list $(GOFLAGS) ./...`
PATHS       ?= $(shell echo $(PACKAGES) | sed -e "s|$(MODULE)/||g" | sed -e "s|$(MODULE)|$(PWD)/*.go|g")
TIMEOUT     ?= 1s

ifeq (, $(GOTEST))
	GOTEST = go test
else
	GOTEST := $(GOTEST) go --colored --stacked
endif

ifeq (, $(PACKAGES))
	PACKAGES = $(MODULE)
endif

ifeq (, $(PATHS))
	PATHS = .
endif

export GOBIN       := $(GOBIN)
export GOFLAGS     := $(GOFLAGS)
export GOPRIVATE   := $(GOPRIVATE)
export GOPROXY     := $(GOPROXY)
export GOTRACEBACK := $(GOTRACEBACK)

go-env:
	@echo "GO111MODULE: $(strip `go env GO111MODULE`)"
	@echo "GOBIN:       $(strip `go env GOBIN`)"
	@echo "GOFLAGS:     $(strip `go env GOFLAGS`)"
	@echo "GOPRIVATE:   $(strip `go env GOPRIVATE`)"
	@echo "GOPROXY:     $(strip `go env GOPROXY`)"
	@echo "GOTEST:      $(GOTEST)"
	@echo "GOTESTFLAGS: $(GOTESTFLAGS)"
	@echo "GOTRACEBACK: $(GOTRACEBACK)"
	@echo "GOVERSION:   $(strip `go version | awk '{print $$3}' | sed -e 's|^go||g'`)"
	@echo "LOCAL:       $(LOCAL)"
	@echo "MODULE:      $(MODULE)"
	@echo "PACKAGES:    $(PACKAGES)"
	@echo "PATHS:       $(strip $(PATHS))"
	@echo "TIMEOUT:     $(TIMEOUT)"
.PHONY: go-env

go-verbose:
	$(eval GOTESTFLAGS := -v) @true
.PHONY: go-verbose

go-deps-check:
	$(AT) go mod verify
	$(AT) govulncheck -tags $(GOTAGS) -test ./...
	$(AT) if command -v egg >/dev/null; then \
		egg deps check license; \
		egg deps check version; \
	fi
.PHONY: go-deps-check

go-deps-clean:
	$(AT) go clean -modcache
.PHONY: go-deps-clean

go-deps-fetch:
	$(AT) go mod download
	$(AT) if [[ "`go env GOFLAGS`" =~ -mod=vendor ]]; then go mod vendor; fi
.PHONY: go-deps-fetch

go-deps-tidy:
	$(AT) go mod tidy
	$(AT) if [[ "`go env GOFLAGS`" =~ -mod=vendor ]]; then go mod vendor; fi
.PHONY: go-deps-tidy

go-deps-update: selector = '{{if not (or .Main .Indirect)}}{{.Path}}{{end}}'
go-deps-update:
	$(AT) if command -v egg >/dev/null; then \
		packages="`egg deps list | tr ' ' '\n'`"; \
	else \
		packages="`go list -f $(selector) -m -mod=readonly all`"; \
	fi; \
	if [ -z "$$packages" ]; then exit; fi; \
	for package in $$packages; do \
		go mod edit -require=$$package@latest; \
		go mod tidy; \
	done
	$(AT) $(MAKE) go-deps-tidy
.PHONY: go-deps-update

go-docs:
	$(AT) go doc -all .
.PHONY: go-docs

go-fmt:
	$(AT) goimports -local $(LOCAL) -w $(PATHS)
.PHONY: go-fmt

go-generate:
	$(AT) go generate $(PACKAGES)
.PHONY: go-generate

# How to work with linters
#
#  ```bash
#  $ golangci-lint linters --out-format=json | jq '.[] | {name: .name, url: .origin}'
#  $ golangci-lint linters --out-format=json | jq '.[] | select(.presets[] | contains ("bugs"))'
#  $ golangci-lint linters --out-format=json | jq '.[] | select(.origin == "")'
#  ```
#
# For more experience see https://jqplay.org, https://stedolan.github.io/jq/.
go-lint:
	$(AT) golangci-lint run --enable looppointer ./...
.PHONY: go-lint

go-pkg:
	$(AT) open https://pkg.go.dev/$(MODULE)@$(RELEASE)
.PHONY: go-pkg

go-check:
	$(AT) $(GOTEST) -count=1 -test.run=^$(uuidgen) ./...
.PHONY: go-check

go-test:
	$(AT) $(GOTEST) -race -timeout $(TIMEOUT) $(GOTESTFLAGS) $(PACKAGES)
.PHONY: go-test

go-test-clean:
	$(AT) go clean -testcache
.PHONY: go-test-clean

go-test-with-coverage:
	$(AT) $(GOTEST) \
		-cover \
		-covermode atomic \
		-coverprofile c.out \
		-race \
		-timeout $(TIMEOUT) \
		$(GOTESTFLAGS) \
		$(PACKAGES)
.PHONY: go-test-with-coverage

go-test-with-coverage-report: go-test-with-coverage
	$(AT) go tool cover -html c.out
.PHONY: go-test-with-coverage-report

go-integration-test: GOTAGS := $(GOTAGS) integration
go-integration-test:
	$(AT) $(GOTEST) -race -tags $(GOTAGS) -timeout $(TIMEOUT) $(GOTESTFLAGS) $(PACKAGES)
.PHONY: go-test-integration-quick

go-integration-test-with-coverage: GOTAGS := $(GOTAGS) integration
go-integration-test-with-coverage:
	$(AT) $(GOTEST) \
		-cover \
		-covermode atomic \
		-coverprofile c.out \
		-race \
		-tags $(GOTAGS) \
		-timeout $(TIMEOUT) \
		$(GOTESTFLAGS) \
		$(PACKAGES)
.PHONY: go-integration-test-with-coverage

go-integration-test-with-coverage-report: go-integration-test-with-coverage
	$(AT) go tool cover -html c.out
.PHONY: go-integration-test-with-coverage-report

go-fuzzing-test:
	$(AT) $(GOTEST) -fuzz $(PACKAGES)
.PHONY: go-fuzzing-test

go-fuzzing-test-clean:
	$(AT) go clean -fuzzcache
.PHONY: go-fuzzing-test-clean

go-performance-test:
	$(AT) $(GOTEST) -bench=. -run=^$(uuidgen) $(GOTESTFLAGS) $(PACKAGES)
.PHONY: go-performance-test

TOOLFLAGS ?= -mod=

go-tools-env:
	@echo "GOBIN:       `go env GOBIN`"
	@echo "TOOLFLAGS:   $(TOOLFLAGS)"
.PHONY: go-tools-env

ifneq (, $(wildcard ./tools/))
go-tools-check: GOFLAGS = $(TOOLFLAGS)
go-tools-check:
	$(AT) cd tools; \
	go mod verify; \
	govulncheck -tags $(GOTAGS) -test ./...; \
	if command -v egg >/dev/null; then \
		egg deps check license; \
		egg deps check version; \
	fi
.PHONY: go-tools-check

go-tools-fetch: GOFLAGS = $(TOOLFLAGS)
go-tools-fetch:
	$(AT) cd tools; go mod download; \
	if [[ "`go env GOFLAGS`" =~ -mod=vendor ]]; then go mod vendor; fi
.PHONY: go-tools-fetch

go-tools-install: GOFLAGS = $(TOOLFLAGS)
go-tools-install: GOTAGS = tools
go-tools-install: go-tools-fetch
	$(AT) cd tools; go generate -tags $(GOTAGS) tools.go
.PHONY: go-tools-install

go-tools-tidy: GOFLAGS = $(TOOLFLAGS)
go-tools-tidy:
	$(AT) cd tools; go mod tidy; \
	if [[ "`go env GOFLAGS`" =~ -mod=vendor ]]; then go mod vendor; fi
.PHONY: go-tools-tidy

go-tools-update: GOFLAGS = $(TOOLFLAGS)
go-tools-update: selector = '{{if not (or .Main .Indirect)}}{{.Path}}{{end}}'
go-tools-update:
	$(AT) cd tools; \
	if command -v egg >/dev/null; then \
		packages="`egg deps list | tr ' ' '\n'`"; \
	else \
		packages="`go list -f $(selector) -m -mod=readonly all`"; \
	fi; \
	if [ -z "$$packages" ]; then exit; fi; \
	for package in $$packages; do \
		go mod edit -require=$$package@latest; \
		go mod tidy; \
	done
	$(AT) $(MAKE) go-tools-tidy go-tools-install
.PHONY: go-tools-update
else
go-tools-disabled:
	@echo have no tools
.PHONY: go-tools-disabled

go-tools-check: go-tools-disabled
	@true
.PHONY: go-tools-check

go-tools-fetch: go-tools-disabled
	@true
.PHONY: go-tools-fetch

go-tools-install: go-tools-disabled
	@true
.PHONY: go-tools-install

go-tools-tidy: go-tools-disabled
	@true
.PHONY: go-tools-tidy

go-tools-update: go-tools-disabled
	@true
.PHONY: go-tools-update
endif

ifneq (, $(shell PATH="$(PATH)" command -v docker))
ifdef GO_VERSIONS

define go_tpl
go-$(1):
	$$(AT) docker run \
		--rm -it \
		-v $(PWD):/src \
		-w /src \
		golang:$(1) bash
.PHONY: go-$(1)
endef

render_go_tpl = $(eval $(call go_tpl,$(version)))
$(foreach version,$(GO_VERSIONS),$(render_go_tpl))

endif
endif

export PATH := $(GOBIN):$(PATH)

setup: git-config git-hooks go-deps-fetch go-tools-install
.PHONY: setup

clean: go-deps-clean go-test-clean go-fuzzing-test-clean
.PHONY: clean

drop: clean git-clean git-rmdir
.PHONY: drop

env: go-env go-tools-env
env:
	@echo "PATH:        $(PATH)"
.PHONY: env

deps: go-deps-fetch
.PHONY: deps

tools: go-tools-install
.PHONY: tools

update:
	@true # TODO:implement go-deps-update go-tools-update generate
.PHONY: update

format: go-fmt
.PHONY: format

generate: go-generate go-fmt
.PHONY: generate

docs:
	@true # TODO:implement go-docs go-pkg
.PHONY: docs

lint: go-lint
.PHONY: lint

test: go-test
.PHONY: test

test-with-coverage: TIMEOUT=5s
test-with-coverage: go-integration-test-with-coverage
.PHONY: test-with-coverage

check: lint test
.PHONY: check

fast-check: find-todos
fast-check: go-check go-deps-check go-tools-check
fast-check: go-deps-tidy go-tools-tidy go-generate git-check
.PHONY: fast-check

full-check: fast-check check
.PHONY: full-check

full-test: go-test go-fuzzing-test go-integration-test go-performance-test
.PHONY: full-test

verbose: make-verbose go-verbose
.PHONY: verbose
