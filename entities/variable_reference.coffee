class VariableReference

  constructor: (@token) ->

  toString: ->
    @token.lexeme

  analyze: (context) ->
    #TODO

  optimize: ->
    #TODO

module.exports = VariableReference
