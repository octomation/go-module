// Package module provides a template for a typical module written on Go.
//
// It's a good starting point to build your module from scratch and
// not to think about boring stuff such as ci/cd configuring and
// docs publishing.
//
// To learn more about the module, read the docs:
//
//	go doc -all .
//
// Want to know how to write Go doc comments?
// Read the official [guide].
//
// [guide]: https://go.dev/doc/comment.
package module

import "golang.org/x/time/rate"

// NewModule returns a new module with [golang.org/x/time/rate.Sometimes].
//
//go:generate echo Module{Limit: rate.Sometimes{once}}
func NewModule() *Module {
	return &Module{
		name:    "go.octolab.org/template/module",
		version: "v1.0.0",
	}
}

// A Module is a stub to show how to describe a type.
type Module struct {
	// Limit is a module rate limit.
	Limit rate.Sometimes

	name    string
	version string // version of the module
}
