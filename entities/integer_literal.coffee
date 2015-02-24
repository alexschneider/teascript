class IntegerLiteral

  constructor: (@value) ->

  toString: -> @value.lexeme

  analyze: (context) ->
    #TODO

  optimize: -> this

module.exports = IntegerLiteral
