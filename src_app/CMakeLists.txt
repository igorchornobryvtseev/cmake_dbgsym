## APP

set (TARGET main_bin)
set (SOURCES main.cpp)
add_executable (${TARGET} ${SOURCES})
target_link_libraries (${TARGET} mylib)
createDbgSym (${TARGET})
install (TARGETS ${TARGET} RUNTIME)

message("-------------------------")
message("TARGET     : ${TARGET}")
message("TARGETS    : ${TARGETS}")
message("SOURCES    : ${SOURCES}")
message("-------------------------")

