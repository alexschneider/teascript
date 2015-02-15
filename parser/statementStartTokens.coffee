class StartTokens
  @statement = [
    'for', 'while',                                  # Start of statement
    @expression
  ]

  @expression = [
    'INTLIT', 'FLOATLIT', 'true', 'false',           # Primitive literals
    'ID', '->', 'trait', 'class',                    # Misc other tokens
    @iterable
  ]

  @iterable = [
    '(', '<', '[', '{', 'STRLIT'                     # Reference type literals
  ]

module.exports = StartTokens
