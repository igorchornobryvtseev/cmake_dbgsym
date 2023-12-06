## LIB

set (TARGET mylib)
set (SOURCES util.cpp)
add_library (${TARGET} SHARED ${SOURCES})
createDbgSym (${TARGET})
install (TARGETS ${TARGET} LIBRARY)

message("-------------------------")
message("TARGET     : ${TARGET}")
message("TARGETS    : ${TARGETS}")
message("SOURCES    : ${SOURCES}")
message("-------------------------")

