; ModuleID = 'command-line-arguments'
source_filename = "command-line-arguments"

@"command-line-arguments.init$guard" = global i1 false, align 1
@0 = private unnamed_addr constant [18 x i8] c"hello llgo-esp32\0A\00", align 1
@1 = private unnamed_addr constant [11 x i8] c"No Press!\0A\00", align 1
@2 = private unnamed_addr constant [9 x i8] c"Preesed\0A\00", align 1

define void @command-line-arguments.init() {
_llgo_0:
  %0 = load i1, ptr @"command-line-arguments.init$guard", align 1
  br i1 %0, label %_llgo_2, label %_llgo_1

_llgo_1:                                          ; preds = %_llgo_0
  store i1 true, ptr @"command-line-arguments.init$guard", align 1
  br label %_llgo_2

_llgo_2:                                          ; preds = %_llgo_1, %_llgo_0
  ret void
}

define void @main() {
_llgo_0:
  %0 = call i32 @gpio_set_direction(i32 34, i32 1)
  %1 = call i32 (ptr, ...) @printf(ptr @0)
  br label %_llgo_1

_llgo_1:                                          ; preds = %_llgo_3, %_llgo_0
  %2 = call i32 @gpio_get_level(i32 34)
  %3 = icmp eq i32 %2, 1
  br i1 %3, label %_llgo_2, label %_llgo_4

_llgo_2:                                          ; preds = %_llgo_1
  %4 = call i32 (ptr, ...) @printf(ptr @1)
  br label %_llgo_3

_llgo_3:                                          ; preds = %_llgo_4, %_llgo_2
  call void @vTaskDelay(i32 10)
  br label %_llgo_1

_llgo_4:                                          ; preds = %_llgo_1
  %5 = call i32 (ptr, ...) @printf(ptr @2)
  br label %_llgo_3
}


declare i32 @gpio_set_direction(i32, i32)

declare i32 @printf(ptr, ...)

declare i32 @gpio_get_level(i32)

declare void @vTaskDelay(i32)
