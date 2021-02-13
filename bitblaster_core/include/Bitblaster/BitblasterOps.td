//===- BitblasterOps.td - Bitblaster dialect ops -----------*- tablegen -*-===//
//
// This file is licensed under the Apache License v2.0 with LLVM Exceptions.
// See https://llvm.org/LICENSE.txt for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
//===----------------------------------------------------------------------===//

#ifndef BITBLASTER_OPS
#define BITBLASTER_OPS

include "BitblasterDialect.td"
//include "mlir/IR/OpBase.td"
include "mlir/Interfaces/SideEffectInterfaces.td"

// Wrapper around C++ OpTrait.
class AtLeastNOperands<int N>
  : ParamNativeOpTrait<"AtLeastNOperands", !cast<string>(N)>;

def Bitblaster_FooOp : Bitblaster_Op<"foo", [NoSideEffect,
                                             SameOperandsAndResultType]> {
    let summary = "Illustrates how to define an operation.";
    let description = [{
        The `bitblaster.foo` operation illustrates how to define a new
        operation in a dialect. It uses an operation trait to declare that it
        has no side effects.

        This operation takes an integer argument and returns an integer.

        Example:

        ```mlir
        %0 = constant 2 : i32
        // Apply the foo operation to %0
        %1 = bitblaster.foo %0 : i32
        ```
    }];

    let arguments = (ins I32:$input);
    let results = (outs I32:$res);

    let assemblyFormat = [{
        $input attr-dict `:` type($input)
    }];
}


def Bitblaster_LogicalAnd : Bitblaster_Op<"logical_and", [
        NoSideEffect,
        SameOperandsAndResultType,
        AtLeastNOperands<2>]> {

    let summary = "Logical conjunction of two or more bits.";
    let description = [{
        The `bitblaster.logical_and` is a side-effect free operation that
        returns the logical conjunction ('and') of two or more operands.

        This operation takes two or more bit arguments and returns a bit.

        Example:

        ```mlir
        // Define constants.
        %0 = constant 0 : i1
        %1 = constant 1 : i1
        // Apply the operation to %0 and %1
        %2 = bitblaster.logical_and %0, %1 : i1
        ```
    }];

    let arguments = (ins Variadic<I1>:$args);
    let results = (outs I1:$res);

    let assemblyFormat = [{
        $args attr-dict
    }];
}

def Bitblaster_LogicalOr : Bitblaster_Op<"logical_or", [
        NoSideEffect,
        SameOperandsAndResultType,
        AtLeastNOperands<2>]> {

    let summary = "Logical disjunction of two or more bits.";
    let description = [{
        The `bitblaster.logical_or` is a side-effect free operation that
        returns the logical disjunction ('or') of two or more operands.

        This operation takes two or more bit arguments and returns a bit.

        Example:

        ```mlir
        // Define constants.
        %0 = constant 0 : i1
        %1 = constant 1 : i1
        // Apply the operation to %0 and %1
        %2 = bitblaster.logical_or %0, %1 : i1
        ```
    }];

    let arguments = (ins Variadic<I1>:$args);
    let results = (outs I1:$res);

    let assemblyFormat = [{
        $args attr-dict
    }];
}

def Bitblaster_LogicalNot : Bitblaster_Op<"logical_not", [NoSideEffect, SameOperandsAndResultType]> {

    let summary = "Logical negation of a bit.";
    let description = [{
        The `bitblaster.logical_not` is a side-effect free operation that
        returns the logical negation of it's operand.

        This operation takes one bit argument and returns a bit.

        Example:

        ```mlir
        // Define constants.
        %0 = constant 0 : i1
        // Apply the operation to %0
        %2 = bitblaster.logical_not %0 : i1
        ```
    }];

    let arguments = (ins I1:$arg0);
    let results = (outs I1:$res);

    let assemblyFormat = [{
        $arg0 attr-dict
    }];
}

#endif // BITBLASTER_OPS
