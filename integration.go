package module

import (
	"context"
	"encoding/xml"
	"fmt"
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
	url := fmt.Sprintf("https://%s/?go-get=1", m.name)
	req, err := http.NewRequest(http.MethodGet, url, nil)
	PanicOnErr(err)
	// compatible with go1.11 and go1.12
	req = req.WithContext(ctx)

	resp, err := http.DefaultClient.Do(req)
	PanicOnErr(err)
	defer func() { _ = resp.Body.Close() }()

	var data struct {
		Head struct {
			Title string `xml:"title"`
		} `xml:"head"`
	}
	decoder := xml.NewDecoder(resp.Body)
	decoder.Strict = false
	decoder.AutoClose = xml.HTMLAutoClose
	decoder.Entity = xml.HTMLEntity
	PanicOnErr(decoder.Decode(&data))
	return m.name == data.Head.Title
}
