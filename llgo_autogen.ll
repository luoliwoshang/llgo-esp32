; ModuleID = 'llgo-esp32'
source_filename = "llgo-esp32"

@"llgo-esp32.init$guard" = global i1 false, align 1
@0 = private unnamed_addr constant [18 x i8] c"hello llgo-esp32\0A\00", align 1
@1 = private unnamed_addr constant [58 x i8] c"\E5\92\B1\E5\90\AC\E5\88\B0\E4\BA\86... 1 (\E6\98\AF\E9\AB\98\E7\94\B5\E5\B9\B3\E5\93\A6\EF\BC\8C\E7\8C\AB\E5\92\AA\E5\9C\A8\E9\AB\98\E5\A4\84\EF\BC\81)\0A\00", align 1
@2 = private unnamed_addr constant [64 x i8] c"\E5\92\B1\E5\90\AC\E5\88\B0\E4\BA\86... 0 (\E6\98\AF\E4\BD\8E\E7\94\B5\E5\B9\B3\E5\93\A6\EF\BC\8C\E7\8C\AB\E5\92\AA\E8\B6\B4\E5\9C\A8\E5\9C\B0\E6\9D\BF\E4\B8\8A\EF\BC\81)\0A\00", align 1

define void @llgo-esp32.init() {
_llgo_0:
  %0 = load i1, ptr @"llgo-esp32.init$guard", align 1
  br i1 %0, label %_llgo_2, label %_llgo_1

_llgo_1:                                          ; preds = %_llgo_0
  store i1 true, ptr @"llgo-esp32.init$guard", align 1
  ; call void @freertos.init()
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

; declare void @freertos.init()

declare i32 @gpio_set_direction(i32, i32)

declare i32 @printf(ptr, ...)

declare i32 @gpio_get_level(i32)

declare void @vTaskDelay(i32)
