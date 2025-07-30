2025-7-30
----
cd ./independant-llgo-esp
bash ./start.sh

当前llgo会链接所有的esp-idf的组件的静态库以及ld脚本（通过使用esp-idf构建一个demo后 build/build.ninja）中提取。

并且在构建main module时，将一般的define @main替换为 @define @app_main()，这样即可做到在go中仍然使用package main func main(){} 进行开发,并且仍然保留这个入口点调用pkgPath.main的过程（类似目前wasm）的处理。

```go
package main

import (
	gpio "github.com/MeteorsLiu/esp32/esp32/esp_driver_gpio"
	"github.com/MeteorsLiu/esp32/esp32/log"

	os "github.com/MeteorsLiu/esp32/esp32/freertos"
	"github.com/goplus/lib/c"
)

func main() {
	tag := c.Str("llgo-esp32")
	time := os.TickTypeT(c.Uint32T(10))
	btnIO := gpio.GpioNumT(gpio.GPIO_NUM_34)
	gpio.GpioSetDirection(btnIO, gpio.GPIO_MODE_INPUT)
	log.EspLogWrite(log.ESP_LOG_INFO, tag, c.Str("hello llgo-esp32!!!!!\n"))
	for {
		level := gpio.GpioGetLevel(btnIO)
		if level == 1 {
			log.EspLogWrite(log.ESP_LOG_INFO, tag, c.Str("没按下去!\n"))
		} else {
			log.EspLogWrite(log.ESP_LOG_INFO, tag, c.Str("按下去了!\n"))
		}
		time.VTaskDelay()
	}
}
```


before 2025-7-30
----

项目初始化
```bash
get_idf
idf.py create-project esp
```

烧录
```bash
bash ./run.sh
```

将会输出以下内容,按下就会输出Preesed
```
No Press!
No Press!
No Press!
Preesed
Preesed
Preesed
Preesed
Preesed
No Press!
No Press!
No Press!
No Press!
Preesed
Preesed
No Press!
```




----

### NOTE
esp-idf 环境下会默认使用乐鑫预构建的 esp-clang ，会缺少后端内容，需要另外
```bash
export PATH="/Users/zhangzhiyang/Documents/Code/temp/tinygo/llvm-build/bin:$PATH"
```