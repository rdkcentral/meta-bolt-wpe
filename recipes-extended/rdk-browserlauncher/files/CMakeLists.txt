cmake_minimum_required(VERSION 3.10)
project(TestURI C)

# Set the C standard
set(CMAKE_C_STANDARD 99)
set(CMAKE_C_STANDARD_REQUIRED ON)

# Find PkgConfig helper module
find_package(PkgConfig REQUIRED)

# Search for libsoup-3.0 and glib-2.0 packages
pkg_check_modules(LIBSOUP REQUIRED IMPORTED_TARGET libsoup-3.0)
pkg_check_modules(GLIB REQUIRED IMPORTED_TARGET glib-2.0)

# Define the executable target
add_executable(testuri testuri.c)

# Link the packages to your executable target
target_link_libraries(testuri
    PRIVATE
        PkgConfig::LIBSOUP
        PkgConfig::GLIB
)
