class Tokens
  
  @oneCharacterTokens = [
    '+', '-', '*', '/',                  # arithmetic operators
    '(', ')',                            # for tuple construction
    '[', ']',                            # for list construction
    '<', '>',                            # for set construction
    '{', '}',                            # for map construction
    '"', "'",                            # for string construction
    '=',                                 # mutation
    '.'                                  # member access for objects
  ]

  @twoCharacterTokens = [
    '<=', '>=',                          # relational operators
    ':=',                                # assignment
    '->'                                 # function
  ]

  @reservedWords = [
    'int', 'double', 'bool', 'none',     # primitive types
    'class', 'trait',                    # reference types
    'for', 'in', 'by', 'while', 'end',   # loops/blocks/range keywords
    'and', 'or', 'is',                   # relational operators
    'true', 'false',                     # boolean literals
    'new'                                # instantiate a class/create an object
  ]

module.exports = Tokens