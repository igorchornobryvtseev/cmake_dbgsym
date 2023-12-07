### PLUGIN
set (DEBUG_SYMBOL_SUFFIX ds)
set(SYMBOLS_BINARY_PATH ${CMAKE_BINARY_DIR}/symdir)    # CMAKE_BINARY_DIR - The path to the top level of the build tree
file(MAKE_DIRECTORY ${SYMBOLS_BINARY_PATH})             # Create the given directories and their parents as needed.
message("SYMBOLS_BINARY_PATH=${SYMBOLS_BINARY_PATH}")
function (createDbgSym binFile)
    set (dsFile ${SYMBOLS_BINARY_PATH}/${binFile}.${DEBUG_SYMBOL_SUFFIX})
    message("binFile    =${binFile}")
    message("dsFile     =${dsFile}")

    add_custom_command(TARGET ${TARGET} POST_BUILD
            COMMAND ${CMAKE_OBJCOPY} --only-keep-debug $<TARGET_FILE:${binFile}> ${dsFile}
            COMMAND ${CMAKE_STRIP} $<TARGET_FILE:${binFile}>
            COMMAND ${CMAKE_OBJCOPY} --add-gnu-debuglink=${dsFile} $<TARGET_FILE:${binFile}>
    )
endfunction()
install(DIRECTORY ${SYMBOLS_BINARY_PATH} TYPE INFO)
