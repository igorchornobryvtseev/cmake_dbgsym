### MAIN FILE
cmake_minimum_required(VERSION 2.8)
project(hello_world)

include(GNUInstallDirs)
set(CMAKE_INSTALL_BINDIR  bin-igorc)
set(CMAKE_INSTALL_LIBDIR  bin-igorc)
set(CMAKE_INSTALL_INFODIR info-igorc)

set(CMAKE_INSTALL_RPATH ${CMAKE_INSTALL_PREFIX}/${CMAKE_INSTALL_LIBDIR})
set(CMAKE_INSTALL_RPATH_USE_LINK_PATH TRUE)
list(APPEND CMAKE_MODULE_PATH "${CMAKE_CURRENT_LIST_DIR}/cmake_adds")   # add directory 'cmake_adds' to search modules
include(DbgSym)   # Load and run CMake code from a file or module

include_directories(inc
                    src_lib)
add_subdirectory(src_app)
add_subdirectory(src_lib)

message("-------------------------")
message("CMAKE_INSTALL_RPATH    : ${CMAKE_INSTALL_RPATH}")
message("CMAKE_MODULE_PATH      : ${CMAKE_MODULE_PATH}")
message("CMAKE_CURRENT_LIST_DIR : ${CMAKE_CURRENT_LIST_DIR}")
message("INCLUDE_DIRECTORIES    : ${INCLUDE_DIRECTORIES}")
