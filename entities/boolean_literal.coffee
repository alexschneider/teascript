Type = require './type'

class BooleanLiteral

  constructor: (@value) ->

  toString: -> @value.lexeme

  analyze: (context) -> @type = Type.BOOL

  optimize: -> this

module.exports = BooleanLiteral
