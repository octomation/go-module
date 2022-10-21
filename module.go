package module

import "golang.org/x/time/rate"

// A Module is a stub to show how to describe a type.
type Module struct {
	// Limit is a module rate limit.
	Limit rate.Limit

	version string // version of the module
}

// NewModule returns a new module with the infinite rate limit
// [golang.org/x/time/rate.Inf].
//
//go:generate echo Module{Limit: rate.Inf}
func NewModule() Module {
	return Module{Limit: rate.Inf, version: "v1.0.0"}
}
