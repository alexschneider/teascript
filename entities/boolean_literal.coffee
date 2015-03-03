class BooleanLiteral

  constructor: (@name) ->

  toString: -> @name.lexeme

  analyze: (context) ->
    #TODO

  optimize: -> this

module.exports = BooleanLiteral
