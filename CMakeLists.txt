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

# C standard setting variable definition
set(COMPILER_FEATURES cxx_std_17)

# Including a string utility function and producing prefixes
include(${CMAKE_SOURCE_DIR}/cmake/core/string/convert_to_uppercase_with_underscores.cmake)
convert_to_uppercase_with_underscores(${PROJECT_NAME} UPPERCASE_PROJECT_NAME)

# Global path variables
set(${UPPERCASE_PROJECT_NAME}_ROOT_PATH ${CMAKE_CURRENT_SOURCE_DIR})
set(${UPPERCASE_PROJECT_NAME}_SOURCE_PATH ${CMAKE_CURRENT_SOURCE_DIR}/source)
set(${UPPERCASE_PROJECT_NAME}_INCLUDE_PATH ${CMAKE_CURRENT_SOURCE_DIR}/include)
set(${UPPERCASE_PROJECT_NAME}_BUILD_PATH ${CMAKE_CURRENT_BINARY_DIR}/build)
set(${UPPERCASE_PROJECT_NAME}_INSTALL_PATH ${CMAKE_CURRENT_BINARY_DIR}/install)
set(${UPPERCASE_PROJECT_NAME}_LIBRARY_PATH ${CMAKE_CURRENT_SOURCE_DIR}/libraries)
set(${UPPERCASE_PROJECT_NAME}_APPLICATION_PATH ${CMAKE_CURRENT_SOURCE_DIR}/applications)
set(${UPPERCASE_PROJECT_NAME}_EXTERNAL_PATH ${CMAKE_CURRENT_SOURCE_DIR}/externals)
set(${UPPERCASE_PROJECT_NAME}_SCRIPT_PATH ${CMAKE_CURRENT_SOURCE_DIR}/scripts)
