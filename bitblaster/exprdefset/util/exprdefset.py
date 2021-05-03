from ...exprdefset_ import ExprDefSet
from .util_index import UtilIndex
from .util_equal import UtilEqual

class UtilExprDefSet(ExprDefSet):

  def __init__(self, ctx):
    ExprDefSet.__init__(self, ctx, baseid='util', package='bitblaster.exprdefset')
    self._expr_defs = [
      UtilIndex(ctx=ctx, expr_def_set=self),
      UtilEqual(ctx=ctx, expr_def_set=self)
    ]

  def expr_defs(self):
    return self._expr_defs

  def valtype_ids(self):
    return ["bitblaster.valtype.bool",
            "bitblaster.valtype.bitvector"]

  def expr_def_set_ids(self):
    return ["bitblaster.exprdefset.logical",
            "bitblaster.exprdefset.bitvector"]

  def targets(self):
    return []
