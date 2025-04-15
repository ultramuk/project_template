function(install_external_package PACKAGE_NAME PACKAGE_IDENTIFIER)
    message(STATUS "Installing ${PACKAGE_NAME}...")

    execute_process(
        COMMAND ${CMAKE_COMMAND}
            -DCMAKE_INSTALL_PREFIX=${${PACKAGE_IDENTIFIER}_INSTALL_PATH}
            -DCMAKE_BUILD_TYPE=${CMAKE_BUILD_TYPE}
            ${PACKAGE_COMPILE_ARGUMENTS}
            ${${PACKAGE_IDENTIFIER}_SOURCE_PATH}
        WORKING_DIRECTORY ${${PACKAGE_IDENTIFIER}_BUILD_PATH}
    )

    execute_process(
        COMMAND ${CMAKE_COMMAND} --build . --target install
        WORKING_DIRECTORY ${${PACKAGE_IDENTIFIER}_BUILD_PATH}
    )

    message(STATUS "Finished installing ${PACKAGE_NAME}")
endfunction()
