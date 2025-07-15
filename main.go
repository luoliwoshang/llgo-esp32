package main

import (
	gpio "github.com/MeteorsLiu/esp32/esp32/esp_driver_gpio"

	os "github.com/MeteorsLiu/esp32/esp32/freertos"

	"github.com/goplus/lib/c"
)

//export app_main
func app_main() {
	time := os.TickTypeT(c.Uint32T(10))
	btnIO := gpio.GpioNumT(gpio.GPIO_NUM_34)
	gpio.GpioSetDirection(btnIO, gpio.GPIO_MODE_INPUT)
	c.Printf(c.Str("hello llgo-esp32\n"))
	for {
		level := gpio.GpioGetLevel(btnIO)
		if level == 1 {
			c.Printf(c.Str("No Press!!!!!!!\n"))
		} else {
			c.Printf(c.Str("Pressed!!!!!!!\n"))
		}
		time.VTaskDelay()
	}

}

func main() {}
