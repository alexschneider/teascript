ClassType = require './class_type'

class Class
  constructor: (@fields) ->

  toString: ->
    "(Class #{('('+k+': '+v+')' for k, v of @fields).join(', ')})"

  analyze: (context, className) ->
    localContext = context.createChildContext()
    for fieldName, fieldValue of @fields
      localContext.variableMustNotBeAlreadyDeclared fieldName,
        "Duplicate class field #{fieldName.lexeme} found in class definition"

      fieldValue.analyze localContext
      fieldName.type = fieldValue.type
      localContext.addVariable fieldName.lexeme, fieldValue

    @type = new ClassType className, @fields

  optimize: (context) ->
    # TODO

module.exports = Class

