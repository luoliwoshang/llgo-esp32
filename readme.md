项目初始化
```bash
get_idf
idf.py create-project esp
```

生成main.go的 .ll 文件

`llgen main.go`

需要暂时注释一下所有非main包的init函数调用和声明
```bash
; declare void @freertos.init()
```

生成.o 文件,这里需要使用乐鑫fork的clang，否则不能编译基于xtensa的内容
```bash
/xxxx/tinygo/llvm-build/bin/clang -target xtensa-esp32-elf -c llgo_autogen.ll -o ./esp/main/llgo.o
```

烧录
```bash
cd esp
idf.py build
idf.py -p /dev/cu.usbserial-110 flash monitor 
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