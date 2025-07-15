#!/bin/bash
llgo build -o ./esp/main/llgo.o ./main.go
source $HOME/esp/esp-idf/export.sh
cd ./esp && idf.py build

idf.py -p /dev/tty.usbserial-110 flash monitor