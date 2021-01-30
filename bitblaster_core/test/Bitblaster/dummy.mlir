// RUN: bitblaster-opt %s | bitblaster-opt | FileCheck %s

module {
    // CHECK-LABEL: func @bar()
    func @bar() {
        %0 = constant 1 : i32
        // CHECK: %{{.*}} = bitblaster.foo %{{.*}} : i32
        %res = bitblaster.foo %0 : i32
        return
    }
}
