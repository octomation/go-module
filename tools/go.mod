module go-module/tools

go 1.11

require (
	github.com/golang/mock v1.4.4
	github.com/golangci/golangci-lint v1.34.0
	github.com/kyoh86/looppointer v0.1.7
	golang.org/x/exp v0.0.0-20201229011636-eab1b5eb1a03
	golang.org/x/tools v0.5.0
)

replace golang.org/x/tools => github.com/kamilsk/go-tools v0.0.5
