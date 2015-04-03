Type = require './type'

class IntegerLiteral

  constructor: (@value) ->

  toString: ->
    @value.lexeme

  analyze: (context) ->
    @type = Type.INT

  optimize: ->
    #TODO

module.exports = IntegerLiteral
