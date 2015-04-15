class Tokens

  @oneCharacterTokens = [
    '+', '-', '*', '/', '%',             # arithmetic operators
    '(', ')',                            # for arguments/parameters
    '[', ']',                            # for list construction
    '<', '>',                            # for set construction
    '{', '}',                            # for map construction
    '|',                                 # for tuple construction
    '=',                                 # assignment
    '.',                                 # member access for objects
    ',',                                 # separating args/params
    ':'                                  # start of a block
  ]

  @twoCharacterTokens = [
    '+=', '-=', '*=', '/=', '%=',        # mutators
    '**',                                # exponent
    '<=', '>=',                          # relational operators
    '->',                                # function
    '..',                                # exclusive range
    ':='                                 # declaration
  ]

  @threeCharacterTokens = [
    '...'                                # inclusive range
  ]

  @reservedWords = [
    'none',                              # none literal
    'class', 'trait',                    # reference types
    'for', 'in', 'by', 'while', 'end',   # loops/blocks/range keywords
    'and', 'or',                         # logical operators
    'is', 'isnt',                        # relational operators
    'if', 'else',                        # if/then
    'not',                               # negation
    'true', 'false',                     # boolean literals
    'new',                               # instantiate a class/create an object
    'return'                             # we need to return from functions
  ]

module.exports = Tokens
