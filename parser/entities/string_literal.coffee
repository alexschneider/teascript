class StringLiteral

  constructor: (@value) ->

  toString: -> @value

  analyze: (context) ->
    #TODO

  optimize: -> this

module.exports = StringLiteral
