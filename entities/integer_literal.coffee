class IntegerLiteral

  constructor: (@value) ->

  toString: -> @value

  analyze: (context) ->
    #TODO

  optimize: -> this

module.exports = IntegerLiteral
