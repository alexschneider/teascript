class Tokens
  
  @oneCharacterTokens = [
    '^', '&', '|',                       # bitwise operators
    '+', '-', '*', '/', '%',             # arithmetic operators
    '(', ')',                            # for tuple construction
    '[', ']',                            # for list construction
    '<', '>',                            # for set construction
    '{', '}',                            # for map construction
    '=',                                 # mutation
    '.'                                  # member access for objects
  ]

  @twoCharacterTokens = [
    '+=', '-=', '*=', '/=', '++', '--',  # mutators
    '<=', '>=',                          # relational operators
    ':=',                                # assignment
    '->'                                 # function
  ]

  @reservedWords = [
    'int', 'double', 'bool', 'none',     # primitive types
    'class', 'trait',                    # reference types
    'for', 'in', 'by', 'while', 'end',   # loops/blocks/range keywords
    'and', 'or', 'is',                   # logical operators
    'if', 'else',                        # if/then
    'not',                               # negation
    'true', 'false',                     # boolean literals
    'new',                               # instantiate a class/create an object
    'return'                             # we need to return from functions
  ]

module.exports = Tokens
