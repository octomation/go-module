# sourced by https://github.com/octomation/makefiles

.DEFAULT_GOAL = check
GIT_HOOKS     = post-merge pre-commit pre-push
GO_VERSIONS   = 1.11 1.12 1.13 1.14 1.15 1.16 1.17 1.18
GO111MODULE   = on

AT    := @
ARCH  := $(shell uname -m | tr '[:upper:]' '[:lower:]')
OS    := $(shell uname -s | tr '[:upper:]' '[:lower:]')
DATE  := $(shell date -u +%Y-%m-%dT%T%Z)
SHELL := /usr/bin/env bash -euo pipefail -c

make-verbose:
	$(eval AT :=) $(eval MAKE := $(MAKE) verbose) @true
.PHONY: make-verbose

todo:
	$(AT) grep \
		--exclude=Makefile \
		--exclude-dir={bin,components,node_modules,vendor} \
		--color \
		--text \
		-inRo -E ' TODO:.*|SkipNow' . || true
.PHONY: todo

COMMIT  := $(shell git rev-parse --verify HEAD)
RELEASE := $(shell git describe --tags 2>/dev/null | rev | cut -d - -f3- | rev)

ifneq (, $(wildcard bin/lib/git/hooks/))
ifdef GIT_HOOKS

hooks: unhook
	$(AT) for hook in $(GIT_HOOKS); do \
		cp bin/lib/git/hooks/$$hook .git/hooks/; \
	done
.PHONY: hooks

unhook:
	$(AT) ls .git/hooks \
	| grep -v .sample \
	| sed 's|.*|.git/hooks/&|' \
	| xargs rm -f || true
.PHONY: unhook

define hook_tpl
$(1):
	$$(AT) bin/lib/git/hooks/$(1)
.PHONY: $(1)
endef

render_hook_tpl = $(eval $(call hook_tpl,$(hook)))
$(foreach hook,$(GIT_HOOKS),$(render_hook_tpl))

endif
else
hooks:
	@echo have no git hooks
.PHONY: hooks

unhook: ;
.PHONY: unhook
endif

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
GOTEST      ?= $(shell PATH=$(PATH) command -v testit)
GOTESTFLAGS ?=
GOTRACEBACK ?= all
LOCAL       ?= $(MODULE)
MODULE      ?= `go list -m $(GOFLAGS)`
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
	@echo "LOCAL:       $(LOCAL)"
	@echo "MODULE:      $(MODULE)"
	@echo "PACKAGES:    $(PACKAGES)"
	@echo "PATHS:       $(strip $(PATHS))"
	@echo "TIMEOUT:     $(TIMEOUT)"
.PHONY: go-env

go-verbose:
	$(eval GOTESTFLAGS := -v)
	@echo >/dev/null
.PHONY: go-verbose

deps-check:
	$(AT) go mod verify
	$(AT) if command -v egg >/dev/null; then \
		egg deps check license; \
		egg deps check version; \
	fi
.PHONY: deps-check

deps-clean:
	$(AT) go clean -modcache
.PHONY: deps-clean

deps-fetch:
	$(AT) go mod download
	$(AT) if [[ "`go env GOFLAGS`" =~ -mod=vendor ]]; then go mod vendor; fi
.PHONY: deps-fetch

deps-tidy:
	$(AT) go mod tidy
	$(AT) if [[ "`go env GOFLAGS`" =~ -mod=vendor ]]; then go mod vendor; fi
.PHONY: deps-tidy

deps-update: selector = '{{if not (or .Main .Indirect)}}{{.Path}}{{end}}'
deps-update:
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
	$(AT) $(MAKE) deps-tidy
.PHONY: deps-update

GODOC_HOST ?= localhost:6060

go-docs:
	$(AT) (sleep 2 && open http://$(GODOC_HOST)/pkg/$(LOCAL)/) &
	$(AT) godoc -http=$(GODOC_HOST)
.PHONY: go-docs

go-fmt:
	$(AT) if command -v goimports >/dev/null; then \
		goimports -local $(LOCAL) -ungroup -w $(PATHS); \
	else \
		gofmt -s -w $(PATHS); \
	fi
.PHONY: go-fmt

go-generate:
	$(AT) go generate $(PACKAGES)
.PHONY: go-generate

go-pkg:
	$(AT) open https://pkg.go.dev/$(MODULE)@$(RELEASE)
.PHONY: go-pkg

lint:
	$(AT) if command -v golangci-lint >/dev/null; then \
		golangci-lint run ./...; \
	else \
		echo have no golangci-lint binary; \
	fi
.PHONY: lint

test:
	$(AT) $(GOTEST) -race -timeout $(TIMEOUT) $(GOTESTFLAGS) $(PACKAGES)
.PHONY: test

test-clean:
	$(AT) go clean -testcache
.PHONY: test-clean

test-quick:
	$(AT) $(GOTEST) -timeout $(TIMEOUT) $(GOTESTFLAGS) $(PACKAGES)
.PHONY: test-quick

test-with-coverage:
	$(AT) $(GOTEST) \
		-cover \
		-covermode atomic \
		-coverprofile c.out \
		-race \
		-timeout $(TIMEOUT) \
		$(GOTESTFLAGS) \
		$(PACKAGES)
.PHONY: test-with-coverage

test-with-coverage-report: test-with-coverage
	$(AT) go tool cover -html c.out
.PHONY: test-with-coverage-report

test-integration: GOTAGS = integration
test-integration:
	$(AT) $(GOTEST) \
		-cover \
		-covermode atomic \
		-coverprofile integration.out \
		-race \
		-tags $(GOTAGS) \
		$(GOTESTFLAGS) \
		./...
.PHONY: test-integration

test-integration-quick: GOTAGS = integration
test-integration-quick:
	$(AT) $(GOTEST) -tags $(GOTAGS) $(GOTESTFLAGS) ./...
.PHONY: test-integration-quick

test-integration-report: test-integration
	$(AT) go tool cover -html integration.out
.PHONY: test-integration-report

TOOLFLAGS ?= -mod=

tools-env:
	@echo "GOBIN:       `go env GOBIN`"
	@echo "TOOLFLAGS:   $(TOOLFLAGS)"
.PHONY: tools-env

ifneq (, $(wildcard ./tools/))
tools-fetch: GOFLAGS = $(TOOLFLAGS)
tools-fetch:
	$(AT) cd tools; \
	go mod download; \
	if [[ "`go env GOFLAGS`" =~ -mod=vendor ]]; then go mod vendor; fi
.PHONY: tools-fetch

tools-tidy: GOFLAGS = $(TOOLFLAGS)
tools-tidy:
	$(AT) cd tools; \
	go mod tidy; \
	if [[ "`go env GOFLAGS`" =~ -mod=vendor ]]; then go mod vendor; fi
.PHONY: tools-tidy

tools-install: GOFLAGS = $(TOOLFLAGS)
tools-install: GOTAGS = tools
tools-install: tools-fetch
	$(AT) cd tools; \
	go generate -tags $(GOTAGS) tools.go
.PHONY: tools-install

tools-update: GOFLAGS = $(TOOLFLAGS)
tools-update: selector = '{{if not (or .Main .Indirect)}}{{.Path}}{{end}}'
tools-update:
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
	$(AT) $(MAKE) tools-tidy tools-install
.PHONY: tools-update
else
tools-disabled:
	@echo have no tools
.PHONY: tools-disabled

tools-fetch: tools-disabled
	@echo >/dev/null
.PHONY: tools-fetch

tools-tidy: tools-disabled
	@echo >/dev/null
.PHONY: tools-tidy

tools-install: tools-disabled
	@echo >/dev/null
.PHONY: tools-install

tools-update: tools-disabled
	@echo >/dev/null
.PHONY: tools-update
endif

ifneq (, $(shell PATH=$(PATH) command -v docker))
ifdef GO_VERSIONS

define go_tpl
go$(1):
	$$(AT) docker run \
		--rm -it \
		-v $(PWD):/src \
		-w /src \
		golang:$(1) bash
.PHONY: go$(1)
endef

render_go_tpl = $(eval $(call go_tpl,$(version)))
$(foreach version,$(GO_VERSIONS),$(render_go_tpl))

endif
endif

export PATH := $(GOBIN):$(PATH)

init: deps check hooks
	$(AT) git config core.autocrlf input
.PHONY: init

check: test lint
.PHONY: check

clean: deps-clean test-clean
.PHONY: clean

deps: deps-fetch tools-install
.PHONY: deps

docs: go-docs
.PHONY: docs

env: go-env tools-env
env:
	@echo "PATH:        $(PATH)"
.PHONY: env

format: go-fmt
.PHONY: format

generate: go-generate format
.PHONY: generate

refresh: deps-tidy update deps generate check
.PHONY: refresh

tools: tools-install
.PHONY: tools

update: deps-update tools-update
.PHONY: update

verbose: make-verbose go-verbose
.PHONY: verbose

verify: deps-check generate check git-check
.PHONY: verify
