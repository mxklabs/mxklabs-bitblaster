//===- BitblasterDialect.td - Bitblaster dialect -----------*- tablegen -*-===//
//
// This file is licensed under the Apache License v2.0 with LLVM Exceptions.
// See https://llvm.org/LICENSE.txt for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
//===----------------------------------------------------------------------===//

#ifndef BITBLASTER_DIALECT
#define BITBLASTER_DIALECT

include "mlir/IR/OpBase.td"

//===----------------------------------------------------------------------===//
// Bitblaster dialect definition.
//===----------------------------------------------------------------------===//

def Bitblaster_Dialect : Dialect {
    let name = "bitblaster";
    let summary = "A bitblaster out-of-tree MLIR dialect.";
    let description = [{
        This dialect is an example of an out-of-tree MLIR dialect designed to
        illustrate the basic setup required to develop MLIR-based tools without
        working inside of the LLVM source tree.
    }];
    let cppNamespace = "::mlir::bitblaster";
}

//===----------------------------------------------------------------------===//
// Base bitblaster operation definition.
//===----------------------------------------------------------------------===//

class Bitblaster_Op<string mnemonic, list<OpTrait> traits = []> :
        Op<Bitblaster_Dialect, mnemonic, traits>;

#endif // BITBLASTER_DIALECT
