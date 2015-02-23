Type = require './type'

class IntegerLiteral

  constructor: (@value) ->
    console.log "int literal!"

  toString: -> @value

  analyze: (context) ->
    @type = Type.INT

  optimize: -> this

module.exports = IntegerLiteral
