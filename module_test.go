package module_test

import (
	"testing"

	. "go.octolab.org/template/module"
)

func TestNewModule(t *testing.T) {
	if NewModule() != "replace me" {
		t.FailNow()
	}
}
