ClassType = require './class_type'
EntityUtils = require './entity_utilities'

class Class
  constructor: (@fieldNames, @fieldValues) ->

  toString: ->
    "(Class #{('('+name.lexeme+': '+@fieldValues[i]+')' for name, i in @fieldNames).join(', ')})"

  analyze: (context, className) ->
    localContext = context.createChildContext()
    fields = {}
    for name, i in @fieldNames
      @fieldValues[i].analyze localContext
      name.type = @fieldValues[i].type
      localContext.variableMustNotBeAlreadyDeclared name,
        "Duplicate class field #{name.lexeme} found in class definition"
      localContext.addVariable name.lexeme, @fieldValues[i]
      fields[name.lexeme] = @fieldValues[i]
    @type = new ClassType className, fields

  optimize: (context) ->
    # TODO

module.exports = Class

