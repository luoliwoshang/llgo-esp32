#!/bin/bash

# 检查参数
if [ $# -ne 1 ]; then
    echo "用法: $0 <项目目录>"
    echo "示例: $0 esp-example/get-started/hello_world"
    exit 1
fi

PROJECT_DIR="$1"

# 检查项目目录是否存在
if [ ! -d "$PROJECT_DIR" ]; then
    echo "错误: 项目目录 '$PROJECT_DIR' 不存在"
    exit 1
fi

# 检查llgo/main.go是否存在
if [ ! -f "$PROJECT_DIR/llgo/main.go" ]; then
    echo "错误: 在 '$PROJECT_DIR/llgo/main.go' 找不到源文件"
    exit 1
fi

# 确保输出目录存在
mkdir -p "$PROJECT_DIR/main"

echo "正在构建项目: $PROJECT_DIR"

export PATH="/Users/zhangzhiyang/Documents/Code/temp/tinygo/llvm-build/bin:$PATH"
cd "$PROJECT_DIR/llgo" && llgo build -o ../main/llgo.o main.go

if [ $? -ne 0 ]; then
    echo "错误: llgo build 失败"
    exit 1
fi

# echo "正在初始化ESP-IDF环境..."
# source $HOME/esp/esp-idf/export.sh

echo "正在构建ESP项目..."
cd "../" && idf.py build

if [ $? -ne 0 ]; then
    echo "错误: idf.py build 失败"
    exit 1
fi

echo "正在烧录和监控..."
idf.py -p /dev/tty.usbserial-110 flash monitor