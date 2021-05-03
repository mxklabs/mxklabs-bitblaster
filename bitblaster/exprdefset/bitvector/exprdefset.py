from ...exprdefset_ import ExprDefSet
from .bitvector_from_bool import BitvectorFromBool
from .bitvector_mult import BitvectorMult

class BitvectorExprDefSet(ExprDefSet):

  def __init__(self, ctx):
    ExprDefSet.__init__(self, ctx, baseid='bitvector', package='bitblaster.exprdefset')
    self._expr_defs = [
      BitvectorFromBool(ctx=ctx, expr_def_set=self),
      BitvectorMult(ctx=ctx, expr_def_set=self)
    ]

  def expr_defs(self):
    return self._expr_defs

  def valtype_ids(self):
    return ["bitblaster.valtype.bool",
            "bitblaster.valtype.bitvector"]

  def expr_def_set_ids(self):
    return ["bitblaster.exprdefset.logical",
            "bitblaster.exprdefset.util"]

  def targets(self):
    return []
