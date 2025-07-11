idf_component_register(SRCS "esp.c"
                    INCLUDE_DIRS ".")

target_link_libraries(${COMPONENT_LIB} PRIVATE "${CMAKE_CURRENT_SOURCE_DIR}/llgo.o")