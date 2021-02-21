module go-module/tools

go 1.11

require (
	github.com/golang/mock v1.5.0
	github.com/golangci/golangci-lint v1.37.1
	github.com/kyoh86/looppointer v0.1.7
	golang.org/x/exp v0.0.0-20210220032938-85be41e4509f
	golang.org/x/tools v0.1.0
)

replace golang.org/x/tools => github.com/kamilsk/go-tools v0.1.0
