package main

import (
	gpio "esp_driver_gpio"
	os "freertos"

	"github.com/goplus/lib/c"
)

//export main
func main() {
	time := os.TickTypeT(c.Uint32T(10))
	btnIO := gpio.GpioNumT(gpio.GPIO_NUM_34)
	gpio.GpioSetDirection(btnIO, gpio.GPIO_MODE_INPUT)
	c.Printf(c.Str("hello llgo-esp32\n"))
	for {
		level := gpio.GpioGetLevel(btnIO)
		if level == 1 {
			c.Printf(c.Str("咱听到了... 1 (是高电平哦，猫咪在高处！)\n"))
		} else {
			c.Printf(c.Str("咱听到了... 0 (是低电平哦，猫咪趴在地板上！)\n"))
		}
		time.VTaskDelay()
	}
}
