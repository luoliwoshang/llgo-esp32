module llgo-esp32

go 1.24.1

replace freertos => github.com/luoliwoshang/goplus-llpkg/freertos v0.0.0-20250708102653-260d144b4535

replace esp_driver_gpio => github.com/MeteorsLiu/esp32/esp32s3/esp_driver_gpio v0.0.0-20250711093505-7e204701f180

require (
	esp_driver_gpio v0.0.0-00010101000000-000000000000
	freertos v0.0.0-00010101000000-000000000000
	github.com/goplus/lib v0.2.0
)
