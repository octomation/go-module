package module_test

import (
	"testing"

	. "go.octolab.org/template/module"
)

func TestNewModule(t *testing.T) {
	i, m := 0, NewModule()
	m.Limit.Do(func() { i++ })
	m.Limit.Do(func() { i++ })
	m.Limit.Do(func() { i++ })

	if i != 1 {
		t.FailNow()
	}
}
