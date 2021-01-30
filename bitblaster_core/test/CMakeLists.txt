configure_lit_site_cfg(
        ${CMAKE_CURRENT_SOURCE_DIR}/lit.site.cfg.py.in
        ${CMAKE_CURRENT_BINARY_DIR}/lit.site.cfg.py
        MAIN_CONFIG
        ${CMAKE_CURRENT_SOURCE_DIR}/lit.cfg.py
)

set(STANDALONE_TEST_DEPENDS
        FileCheck count not
        bitblaster-opt
        bitblaster-translate
        )

add_lit_testsuite(check-bitblaster "Running the bitblaster regression tests"
        ${CMAKE_CURRENT_BINARY_DIR}
        DEPENDS ${STANDALONE_TEST_DEPENDS}
        )
set_target_properties(check-bitblaster PROPERTIES FOLDER "Tests")

add_lit_testsuites(STANDALONE ${CMAKE_CURRENT_SOURCE_DIR} DEPENDS ${STANDALONE_TEST_DEPENDS})
