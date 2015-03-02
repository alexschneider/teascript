tokens = require '../scanner/tokens'
class StartTokens

  @unaryExpression = [
    '--', '++', 'not', '-'
  ]

  @iterable = [
    '(', '<', '[', '{', 'STRLIT'          # Reference type literals
  ]

  @expression = [
    'INTLIT', 'FLOATLIT', 'true', 'false', # Primitive literals
    'ID', '->', 'trait', 'class',          # Misc other tokens
    @iterable, tokens.beginnings,
    @unaryExpression
  ]

  @statement = [
    'for', 'while',                        # Start of statement
    @expression
  ]


module.exports = StartTokens
