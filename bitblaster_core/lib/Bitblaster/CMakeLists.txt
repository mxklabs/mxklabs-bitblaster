add_mlir_dialect_library(MLIRBitblaster
        BitblasterDialect.cpp
        BitblasterOps.cpp

        ADDITIONAL_HEADER_DIRS
        ${PROJECT_SOURCE_DIR}/include/Bitblaster

        DEPENDS
        MLIRBitblasterOpsIncGen

	LINK_LIBS PUBLIC
	MLIRIR
	)
