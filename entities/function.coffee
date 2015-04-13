Type = require './type'

class Function

  constructor: (@params, @body) ->

  toString: ->
    "(Func #{@params} #{@body})"

  analyze: (context) ->
    @type = Type.FUNC
    localContext = context.createChildContext()

    for param in @params
      localContext.variableMustNotBeAlreadyDeclared param,
        "Duplicate parameter #{param.lexeme} found in function definition"
      param.type = Type.ARBITRARY
      localContext.addVariable param.lexeme, param

    @body.analyze localContext

  optimize: ->
    #TODO

module.exports = Function