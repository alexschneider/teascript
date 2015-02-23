class StartTokens
  @statement = [
    #statements
      'for', 'while',                           # Start of statement

      #expressions
      [
        'INTLIT', 'FLOATLIT', 'true', 'false',  # Primitive literals
        'ID', '->', 'trait', 'class',           # Misc other tokens

        #iterables
        [
          '(', '<', '[', '{', 'STRLIT'          # Reference type literals
        ]
      ]
    ]

module.exports = StartTokens
