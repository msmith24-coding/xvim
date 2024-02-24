# Minimum version of CMake required.
cmake_minimum_required(VERSION 3.20)

project(xvim)

set(CMAKE_EXPORT_COMPILE_COMMANDS ON)

set(CMAKE_C_STANDARD 17)
set(CMAKE_C_STANDARD_REQUIRED ON)

set(SOURCES
    src/xvim.c
)

include_directories(include)

add_executable(${PROJECT_NAME} ${SOURCES})
