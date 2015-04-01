Type = require './type'

class NoneLiteral

  constructor: (@value) ->

  toString: -> @value.lexeme

  analyze: (context) -> @type = Type.NONE

  optimize: -> this

module.exports = NoneLiteral