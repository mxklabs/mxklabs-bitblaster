//===- BitblasterDialect.cpp - Bitblaster dialect ---------------*- C++ -*-===//
//
// This file is licensed under the Apache License v2.0 with LLVM Exceptions.
// See https://llvm.org/LICENSE.txt for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
//===----------------------------------------------------------------------===//

#include "Bitblaster/BitblasterDialect.h"
#include "Bitblaster/BitblasterOps.h"

using namespace mlir;
using namespace mlir::bitblaster;

//===----------------------------------------------------------------------===//
// Bitblaster dialect.
//===----------------------------------------------------------------------===//

void BitblasterDialect::initialize() {
  addOperations<
#define GET_OP_LIST
#include "Bitblaster/BitblasterOps.cpp.inc"
      >();
}
