module go-module/tools

go 1.11

require (
	github.com/golang/mock v1.6.0
	github.com/golangci/golangci-lint v1.41.1
	golang.org/x/exp v0.0.0-20210618142145-ffcf9a09ea36
	golang.org/x/tools v0.1.3
)

replace (
	github.com/golangci/golangci-lint => github.com/kamilsk/golangci-lint v1.41.1
	golang.org/x/tools => github.com/kamilsk/go-tools v0.1.3
)
