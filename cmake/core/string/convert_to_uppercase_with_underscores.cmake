function(convert_to_uppercase_with_underscores INPUT OUTPUT)
    string(REPLACE "-" "_" CONVERTED_STRING "${INPUT}")
    string(REPLACE " " "_" CONVERTED_STRING "${CONVERTED_STRING}")
    string(TOUPPER "${CONVERTED_STRING}" CONVERTED_STRING)
    set(${OUTPUT} ${CONVERTED_STRING} PARENT_SCOPE)
endfunction()
