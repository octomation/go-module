//go:build integration
// +build integration

package module_test

import (
	"context"
	"errors"
	"testing"

	. "go.octolab.org/template/module"
)

func TestIntegration(t *testing.T) {
	if !Ping(context.Background(), NewModule()) {
		t.FailNow()
	}

	defer func() {
		if r := recover(); r == nil {
			t.FailNow()
		}
	}()
	PanicOnErr(errors.New("test"))
}
