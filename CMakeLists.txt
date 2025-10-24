cmake_minimum_required(VERSION 3.20)
project(library VERSION 0.1.0 LANGUAGES C CXX)

set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

if (UNIX)
    if (NOT CMAKE_C_COMPILER_ID STREQUAL "Clang" OR NOT CMAKE_CXX_COMPILER_ID STREQUAL "Clang")
        message(FATAL_ERROR "Clang toolchain is required!")
    endif ()

    include(CheckCXXSourceCompiles)

    check_cxx_source_compiles(
        "
        #include <ciso646>

        int main() {
        #ifdef _LIBCPP_VERSION
            return 0;
        #else
            #error unsupported
        #endif
        }
        "
        HAVE_LIBCPP
    )

    if (NOT HAVE_LIBCPP)
        message(FATAL_ERROR "libc++ is required!")
    endif ()

    add_compile_options(-Wno-invalid-offsetof)
endif ()

add_library(${PROJECT_NAME} SHARED src/library.cpp)
target_link_libraries(${PROJECT_NAME} PRIVATE log)
install(TARGETS ${PROJECT_NAME} DESTINATION ${CMAKE_BINARY_DIR}/bin)
