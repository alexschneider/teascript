class Tokens

  @oneCharacterTokens = [
    '^', '&', '|',                       # bitwise operators
    '+', '-', '*', '/', '%',             # arithmetic operators
    '(', ')',                            # for tuple construction
    '[', ']',                            # for list construction
    '<', '>',                            # for set construction
    '{', '}',                            # for map construction
    '=',                                 # assignment
    '.',                                 # member access for objects
    ',',                                 # separating args/params
    ':'                                  # start of a block
  ]

  @twoCharacterTokens = [
    '+=', '-=', '*=', '/=', '++', '--',  # mutators
    '<=', '>=',                          # relational operators
    '->',                                # function
    '..', 'by',                          # range
    ':='                                 # declaration
  ]

  @beginnings = [
    'int', 'double', 'bool', 'none',     # primitive types
    'class', 'trait',                    # reference types
    'for', 'while',                      # loops/blocks/range keywords
    'if',                                # if/then
    'not',                               # negation
    'true', 'false',                     # boolean literals
    'new',                               # instantiate a class/create an object
    'return'                             # we need to return from functions
  ]

  @otherReservedWords = [
    'and', 'or',                         # logical operators
    'is', 'isnt',                        # relational operators
    'else',                              # if/then
    'in', 'end'                          # loops/blocks/range keywords
  ]

module.exports = Tokens
