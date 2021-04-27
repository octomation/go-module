module go-module/tools

go 1.11

require (
	github.com/golang/mock v1.5.0
	github.com/golangci/golangci-lint v1.40.1
	golang.org/x/exp v0.0.0-20210526181343-b47a03e3048a
	golang.org/x/tools v0.1.2
)

replace (
	github.com/golangci/golangci-lint => github.com/kamilsk/golangci-lint v1.40.1
	golang.org/x/tools => github.com/kamilsk/go-tools v0.1.2
)
