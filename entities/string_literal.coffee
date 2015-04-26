Type = require './type'

class StringLiteral

  constructor: (@value) ->

  toString: ->
    @value.lexeme

  analyze: (context) ->
    @type = Type.STR

  optimize: ->
    #TODO

  expression: true

module.exports = StringLiteral
