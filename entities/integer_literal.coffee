Type = require './type'

class IntegerLiteral

  constructor: (@value) ->

  toString: ->
    @value.lexeme

  analyze: (context) ->
    @type = Type.INT

  optimize: ->
    #TODO

  expression: true

module.exports = IntegerLiteral
