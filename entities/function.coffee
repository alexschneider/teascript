Type = require './type'

class Function

  constructor: (@params, @body) ->

  toString: ->
    "(Func (#{(param.lexeme for param in @params).join(', ')}) #{@body})"

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
    # We can't return null on an empty body because we might want a function
    # to be a noop
    @body = @body.optimize()


  expression: true

module.exports = Function
