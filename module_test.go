package go_module_test

import (
	"testing"

	. "go-module"
)

func TestNewModule(t *testing.T) {
	if NewModule() != "replace me" {
		t.FailNow()
	}
}
