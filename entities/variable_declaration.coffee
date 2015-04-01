Type = require './type'

class VariableDeclaration

  constructor: (@id, @value) ->

  toString: ->
    "(VarDec (#{@id.lexeme} #{@value}))"

  analyze: (context) ->
    context.variableMustNotBeAlreadyDeclared @id
    context.addVariable @id.lexeme, this

  optimize: ->
    #TODO

VariableDeclaration.ARBITRARY = new VariableDeclaration '<arbitrary>', Type.ARBITRARY

module.exports = VariableDeclaration
