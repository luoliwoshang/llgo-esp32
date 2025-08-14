package main

import (
	gpio "github.com/MeteorsLiu/esp32/esp32/esp_driver_gpio"
	"github.com/MeteorsLiu/esp32/esp32/log"

	os "github.com/MeteorsLiu/esp32/esp32/freertos"
	"github.com/goplus/lib/c"
)

func main() {
	// "github.com/luoliwoshang/llgo-esp32/emb/machine" will cause memory error
	// _ = machine.GPIO34
	tag := c.Str("llgo-esp32")
	time := os.TickTypeT(c.Uint32T(10))
	btnIO := gpio.GpioNumT(gpio.GPIO_NUM_34)
	gpio.GpioSetDirection(btnIO, gpio.GPIO_MODE_INPUT)
	log.EspLogWrite(log.ESP_LOG_INFO, tag, c.Str("hello～～～～ llgo-esp32!!!!!\n"))
	for {
		level := gpio.GpioGetLevel(btnIO)
		if level == 1 {
			log.EspLogWrite(log.ESP_LOG_INFO, tag, c.Str("没按下去dasdsadsadas～～～!!!!\n"))
		} else {
			log.EspLogWrite(log.ESP_LOG_INFO, tag, c.Str("按下去了dasdasdas～～～～!!!!\n"))
		}
		time.VTaskDelay()
	}
}
