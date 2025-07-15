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