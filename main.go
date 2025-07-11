package main

import (
	"freertos"

	"github.com/goplus/lib/c"
)

//export main
func main() {
	time := freertos.TickTypeT(c.Uint32T(1000))
	for {
		time.VTaskDelay()
	}
}
