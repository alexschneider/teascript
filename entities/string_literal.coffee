Type = require './type'

class StringLiteral

  constructor: (@value) ->

  toString: ->
    @value.lexeme

  analyze: (context) ->
    @type = Type.STR

  length: ->
    console.log @.value.lexeme.length - 2
    @.value.lexeme.length - 2
    
  optimize: ->
    #TODO

module.exports = StringLiteral
