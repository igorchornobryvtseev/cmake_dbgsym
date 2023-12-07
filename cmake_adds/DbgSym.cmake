### PLUGIN

# CMAKE_BINARY_DIR        - The path to the top level of the build tree

set (DEBUG_SYMBOL_SUFFIX ds)
set(SYMBOLS_BINARY_PATH ${CMAKE_BINARY_DIR}/symdir)    # CMAKE_BINARY_DIR - The path to the top level of the build tree
file(MAKE_DIRECTORY ${SYMBOLS_BINARY_PATH})             # Create the given directories and their parents as needed.
message("SYMBOLS_BINARY_PATH=${SYMBOLS_BINARY_PATH}")
function (createDbgSym binFile)
    set (dsFile ${SYMBOLS_BINARY_PATH}/${binFile}.${DEBUG_SYMBOL_SUFFIX})

    add_custom_command(TARGET ${TARGET} POST_BUILD

            # COMMENT "igorc this-is-a-comment dsFile=${dsFile}" # only the last comment is printed
            # COMMAND ${CMAKE_COMMAND} -E echo "igorc dsFile=${dsFile}"
            COMMAND ${CMAKE_COMMAND} -E cmake_echo_color --yellow "igorc binFile=$<TARGET_FILE:${binFile}>"
            COMMAND ${CMAKE_COMMAND} -E cmake_echo_color --yellow "igorc dsFile =${dsFile}"

            COMMAND ${CMAKE_OBJCOPY} --only-keep-debug $<TARGET_FILE:${binFile}> ${dsFile} # TARGET_FILE generator expression: Full path to main file (.exe, .so.1.2, .a) where tgt is the name of a target.
            COMMAND ${CMAKE_STRIP} $<TARGET_FILE:${binFile}>
            COMMAND ${CMAKE_OBJCOPY} --add-gnu-debuglink=${dsFile} $<TARGET_FILE:${binFile}>
    )
endfunction()
install(DIRECTORY ${SYMBOLS_BINARY_PATH} TYPE INFO)
