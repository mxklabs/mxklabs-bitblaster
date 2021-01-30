# Bitblaster Core

This folder contains [MLIR](https://mlir.llvm.org/)-based tooling for processing logic expressions.

## Requirements

**Compiler & Linker**

You need a C++ build tools, such as a compiler and a linker.

| :information_source: Hint                                    |
| ------------------------------------------------------------ |
| On Ubuntu, install these with, e.g., `sudo apt-get install clang lld build-essentials`. |

**CMake**

This project uses the [CMake](https://cmake.org/) build automation tool.

| :information_source: Hint                                    |
| ------------------------------------------------------------ |
| The easiest way to install CMake is inside a [Python](https://www.python.org/) 3 [virtual environment](https://docs.python.org/3/tutorial/venv.html) using `pip install cmake`. |

**Ninja**

We use [Ninja](https://ninja-build.org/) to manage the actual build process.

| :information_source: Hint                                    |
| ------------------------------------------------------------ |
| The easiest way to install Ninja is inside a [Python](https://www.python.org/) 3 [virtual environment](https://docs.python.org/3/tutorial/venv.html) using `pip install ninja`. |

**LLVM library**

You need the [llvm-project](https://mlir.llvm.org/) library to be available on your system.

| :information_source: Hint                                    |
| ------------------------------------------------------------ |
| Please find build instructions [here](https://mlir.llvm.org/getting_started/), but ensure you use the additional option `-DLLVM_INSTALL_UTILS=ON` when calling `cmake` to make `FileCheck` available. After building, you can install the library with `sudo cmake --install .`.[^1] |

## Building

This setup assumes that you have built LLVM and MLIR in `$BUILD_DIR` and installed them to `$PREFIX`. To build and launch the tests, run
```sh
mkdir build && cd build
cmake -G Ninja .. -DMLIR_DIR=$PREFIX/lib/cmake/mlir -DLLVM_EXTERNAL_LIT=$BUILD_DIR/bin/llvm-lit
cmake --build . --target check-standalone
```
To build the documentation from the TableGen description of the dialect operations, run
```sh
cmake --build . --target mlir-doc
```
**Note**: Make sure to pass `-DLLVM_INSTALL_UTILS=ON` when building LLVM with CMake in order to install `FileCheck` to the chosen installation prefix.


[^1]: You can install it in a local directory and pass `-DMLIR_DIR=$PREFIX/lib/cmake/mlir` to `bitblaster_core`'s cmake line.
