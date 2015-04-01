Type = require './type'

class StringLiteral

  constructor: (@value) ->

  toString: -> @value.lexeme

  analyze: (context) -> @type = Type.STR

  optimize: -> this

module.exports = StringLiteral
