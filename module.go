package module

import "golang.org/x/time/rate"

func NewModule() rate.Limit {
	return rate.Inf
}
