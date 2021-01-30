# Bitblaster Core

This folder contains [MLIR](https://mlir.llvm.org/)-based tooling for processing logic expressions.

## Requirements

**Build Tools**

You need a C++ build tools, such as a compiler and a linker. 

On Ubuntu, install these as follows:

```
sudo apt-get install clang lld build-essentials
```

You also need [CMake](https://cmake.org/), [Ninja](https://ninja-build.org/) to manage the build process and [lit](https://llvm.org/docs/CommandGuide/lit.html) for testing purposes. 

You can install these inside a [Python](https://www.python.org/) 3 [virtual environment](https://docs.python.org/3/tutorial/venv.html) using `pip install cmake` as follows:

```
pip install cmake ninja lit
```

**MLIR library**

You need the [MLIR](https://mlir.llvm.org/) library, which is part of the [LLVM project](https://llvm.org/), to be available on your system. We generally follow the instructions [here](https://mlir.llvm.org/getting_started/), but we need the additional option `-DLLVM_INSTALL_UTILS=ON` to make sure `FileCheck` is installed. Also, we build all targets with `cmake --build .` to ensure all required files are built, instead of only the `check-mlir` target. Finally, we install the project into the default system paths for ease of use.[^1]

```
git clone https://github.com/llvm/llvm-project.git
mkdir llvm-project/build
cd llvm-project/build
cmake -G Ninja ../llvm \
    -DLLVM_ENABLE_PROJECTS=mlir \
    -DLLVM_BUILD_EXAMPLES=ON \
    -DLLVM_TARGETS_TO_BUILD="X86;NVPTX;AMDGPU" \
    -DCMAKE_BUILD_TYPE=Release \
    -DLLVM_ENABLE_ASSERTIONS=ON \
    -DCMAKE_C_COMPILER=clang \
    -DCMAKE_CXX_COMPILER=clang++ \ 
    -DLLVM_ENABLE_LLD=ON \ 
    -DLLVM_INSTALL_UTILS=ON
cmake --build .
sudo cmake --install .
```

## Building

This setup assumes that you have built LLVM and MLIR in `$BUILD_DIR` and installed them to `$PREFIX`. To build and launch the tests, run
```sh
mkdir build && cd build
cmake -G Ninja ..
cmake --build . --target check-standalone
```
To build the documentation from the TableGen description of the dialect operations, run
```sh
cmake --build . --target mlir-doc
```
**Note**: Make sure to pass `-DLLVM_INSTALL_UTILS=ON` when building LLVM with CMake in order to install `FileCheck` to the chosen installation prefix.


[^1]: You can opt to install the library in a local directory directories. You will need to tell `bitblaster_core` where to find it by passing, e.g., `-DMLIR_DIR=$PREFIX/lib/cmake/mlir` and `-DLLVM_EXTERNAL_LIT=$BUILD_DIR/bin/llvm-lit` to CMake .
