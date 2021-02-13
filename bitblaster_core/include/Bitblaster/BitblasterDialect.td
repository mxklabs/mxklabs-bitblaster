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
    let summary = "An out-of-tree MLIR dialect for propositional logic.";
    let description = [{
        This is an out-of-tree MLIR dialect to express operations that can be
        mapped to propositional logic formulae.
    }];
    let cppNamespace = "::mlir::bitblaster";
}

//===----------------------------------------------------------------------===//
// Base bitblaster operation definition.
//===----------------------------------------------------------------------===//

class Bitblaster_Op<string mnemonic, list<OpTrait> traits = []> :
        Op<Bitblaster_Dialect, mnemonic, traits>;

#endif // BITBLASTER_DIALECT
