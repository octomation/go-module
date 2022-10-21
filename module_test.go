package module_test

import (
	"testing"

	"golang.org/x/time/rate"

	. "go.octolab.org/template/module"
)

func TestNewModule(t *testing.T) {
	if NewModule().Limit != rate.Inf {
		t.FailNow()
	}
}
