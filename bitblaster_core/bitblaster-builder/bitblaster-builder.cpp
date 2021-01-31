//===- bitblaster-translate.cpp ---------------------------------*- C++ -*-===//
//
// This file is licensed under the Apache License v2.0 with LLVM Exceptions.
// See https://llvm.org/LICENSE.txt for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
//===----------------------------------------------------------------------===//
//
// This is a command line utility that translates a file from/to MLIR using one
// of the registered translations.
//
//===----------------------------------------------------------------------===//

#include <iostream>


#include "mlir/IR/Dialect.h"
#include "mlir/IR/MLIRContext.h"

#include "mlir/InitAllDialects.h"
#include "mlir/InitAllPasses.h"
#include "mlir/Pass/Pass.h"
#include "mlir/Pass/PassManager.h"

#include "mlir/Support/FileUtilities.h"
#include "mlir/Support/MlirOptMain.h"
#include "llvm/Support/CommandLine.h"
#include "llvm/Support/InitLLVM.h"
#include "llvm/Support/SourceMgr.h"
#include "llvm/Support/ToolOutputFile.h"

#include "mlir/InitAllTranslations.h"
#include "mlir/Support/LogicalResult.h"
#include "mlir/IR/Builders.h"
#include "mlir/Translation.h"

#include "Bitblaster/BitblasterDialect.h"
#include "Bitblaster/BitblasterOps.h"

int main(int argc, char **argv) {
  //mlir::registerAllTranslations();

  mlir::DialectRegistry registry;
  registry.insert<mlir::bitblaster::BitblasterDialect>();
  registry.insert<mlir::StandardOpsDialect>();

  // TODO: Register bitblaster translations here.
  mlir::MLIRContext ctx;
  mlir::OpBuilder builder(&ctx);

  //builder.create<BitblasterLogicalAnd>();
  auto file0 = mlir::Identifier::get("buildblaster-builder.cpp", &ctx);
  auto loc0 = mlir::FileLineColLoc::get(file0, 50, 13, &ctx);

  auto op0 = builder.create<mlir::ConstantOp>(
    loc0,
    builder.getI1Type(),
    builder.getIntegerAttr(builder.getI1Type(), 0));

  auto op1 = builder.create<mlir::ConstantOp>(
    loc0,
    builder.getI1Type(),
    builder.getIntegerAttr(builder.getI1Type(), 1));

  auto op2 = builder.create<mlir::bitblaster::LogicalAnd>(
    loc0,
    // builder.getI1Type(),
    mlir::ValueRange({op0, op1}));

  std::cout << builder.getBlock() << std::endl;

  return 0;
  //return failed(
  //    mlir::mlirTranslateMain(argc, argv, "MLIR Translation Testing Tool"));
}
