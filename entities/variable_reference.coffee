class VariableReference

  constructor: (@token) ->

  toString: ->
    @token.lexeme

  analyze: (context) ->
    @referent = context.lookupVariable @token
    @type = @referent.type

  optimize: ->
    #TODO

  expression: true

module.exports = VariableReference
