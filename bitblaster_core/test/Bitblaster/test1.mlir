module {
  %0 = constant 0 : i1
  %1 = constant 1 : i1
  %tmp0 = bitblaster.logical_and %0, %1
  %tmp1 = bitblaster.logical_or %tmp0, %1
  %res = bitblaster.logical_not %tmp1
}
