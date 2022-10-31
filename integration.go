package module

import (
	"context"
	"encoding/json"
	"net/http"
)

// PanicOnErr panics if err is not nil.
func PanicOnErr(err error) {
	if err != nil {
		panic(err)
	}
}

// Ping sends a request to the module and returns true if it's successful.
func Ping(ctx context.Context, m *Module) bool {
	req, err := http.NewRequest(http.MethodGet, m.url, nil)
	PanicOnErr(err)
	// compatible with go1.11 and go1.12
	req = req.WithContext(ctx)

	resp, err := http.DefaultClient.Do(req)
	PanicOnErr(err)
	defer func() { _ = resp.Body.Close() }()

	var data struct {
		URL string `json:"url"`
	}
	PanicOnErr(json.NewDecoder(resp.Body).Decode(&data))
	return data.URL == m.url
}
