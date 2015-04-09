Type = require './type'

class Parameters

  constructor: (@params) ->

  toString: ->
    "(#{(param.lexeme for param in @params).join(', ')})"

  analyze: (context) ->
    for param in @params
      context.variableMustNotBeAlreadyDeclared param,
        "Duplicate parameter #{param.lexeme} found in function definition"
      param.type = Type.ARBITRARY
      context.addVariable param.lexeme, param

  optimize: ->
    # TODO


module.exports = Parameters