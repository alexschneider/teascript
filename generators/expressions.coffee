BinaryExpression = require '../entities/binary_expression'
Block = require '../entities/block'
BooleanLiteral = require '../entities/boolean_literal'
ConditionalExpression = require '../entities/conditional_expression'
FieldAccess = require '../entities/field_access'
Function = require '../entities/function'
FunctionInvocation = require '../entities/function_invocation'
IntegerLiteral = require '../entities/integer_literal'
ListLiteral = require '../entities/list_literal'
MapLiteral = require '../entities/map_literal'
NoneLiteral = require '../entities/none_literal'
Object = require '../entities/object'
PreUnaryExpression = require '../entities/pre_unary_expression'
Range = require '../entities/range'
SetLiteral = require '../entities/set_literal'
StringLiteral = require '../entities/string_literal'
TupleLiteral = require '../entities/tuple_literal'
VariableReference = require '../entities/variable_reference'


Set = require 'es6-set'

module.exports = new Set [
  BinaryExpression,
  Block,
  BooleanLiteral,
  ConditionalExpression,
  FieldAccess,
  Function,
  FunctionInvocation,
  IntegerLiteral,
  ListLiteral,
  MapLiteral,
  NoneLiteral,
  Object,
  PreUnaryExpression,
  Range,
  SetLiteral,
  StringLiteral,
  TupleLiteral,
  VariableReference
]
