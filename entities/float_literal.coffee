Type = require './type'

class FloatLiteral

  constructor: (@value) ->

  toString: -> @value.lexeme

  analyze: (context) ->
    @type = Type.FLOAT

  optimize: -> this

module.exports = FloatLiteral
