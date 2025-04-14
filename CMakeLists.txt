# Root CMakeLists.txt
# - Defines project metadata and global settings
# - Initializes compiler flags and build options
# - Declares global project paths
# - Includes shared CMake modules
# - Registers subdirectories (libraries, applications, externals, scripts)

# CMake minimum version setting
set(CMAKE_VERSION_MINIMUM 3.15)
cmake_minimum_required(VERSION ${CMAKE_VERSION_MINIMUM})

# Project Meta Information Variable Declaration
set(PROJECT_NAME project_template)
set(PROJECT_VERSION 1.0.0)
set(PROJECT_DESCRIPTION "A modern modular C++ project template using CMake")
set(PROJECT_HOMEPAGE_URL "<https://github.com/ultramuk/project_template>")

# Reset the project
project(
    ${PROJECT_NAME}
    VERSION ${PROJECT_VERSION}
    DESCRIPTION ${PROJECT_DESCRIPTION}
    HOMEPAGE_URL ${PROJECT_HOMEPAGE_URL}
)

# Build type confirmation & Output control setting
if(CMAKE_BUILD_TYPE STREQUAL "Release")
    set(CMAKE_VERBOSE_MAKEFILE OFF)
else()
    set(CMAKE_VERBOSE_MAKEFILE ON)
endif()

# Compiler flag definition
set(COMPILER_FLAGS_FOR_MSVC /W4 /WX /permissive-)
set(COMPILER_FLAGS_FOR_GCC -Wall -Wpedantic -Wextra -Werror)

# Compiler ID -based conditional processing
if(NOT COMPILER_FLAGS)
    if(CMAKE_CXX_COMPILER_ID STREQUAL MSVC)
        set(COMPILER_FLAGS ${COMPILER_FLAGS_FOR_MSVC})
    else()
        set(COMPILER_FLAGS ${COMPILER_FLAGS_FOR_GCC})
    endif()
endif()
