export PATH="/Users/zhangzhiyang/.espressif/tools/esp-clang/esp-18.1.2_20240912/esp-clang/bin:$PATH"
llgo build -o test main.go
# Convert ELF to BIN
python /Users/zhangzhiyang/esp/esp-idf/components/esptool_py/esptool/esptool.py --chip esp32 elf2image --flash_mode dio --flash_freq 40m --flash_size 2MB --elf-sha256-offset 0xb0 --min-rev-full 0 --max-rev-full 399 -o /Users/zhangzhiyang/Documents/Code/goplus/llgo-esp32/independant-llgo-esp/test.bin /Users/zhangzhiyang/Documents/Code/goplus/llgo-esp32/independant-llgo-esp/test.elf
# Flash the BIN to ESP32
python -m esptool --chip esp32 -b 460800 --before default_reset --after hard_reset write_flash 0x10000 /Users/zhangzhiyang/Documents/Code/goplus/llgo-esp32/independant-llgo-esp/test.bin
