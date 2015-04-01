class VariableReference

  constructor: (@token) ->

  toString: ->
    @token.lexeme

  analyze: (context) ->
    @type = context.lookupVariable @token

  optimize: ->
    #TODO

module.exports = VariableReference
