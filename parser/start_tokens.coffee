tokens = require '../scanner/tokens'
class StartTokens

  @unaryExpression = [
    'not', '-'
  ]

  @iterable = [
    '(', '<', '[', '{', 'STRLIT'                   # Reference type literals
  ]

  @expression = [
    'INTLIT', 'FLOATLIT', 'true', 'false', 'none', # Primitive literals
    'if', 'ID', '->', 'trait', 'class', 'new',     # Misc other tokens
    @iterable,
    @unaryExpression
  ]

  @statement = [
    'for', 'while', 'return',                      # Start of statement
    @expression
  ]


module.exports = StartTokens
