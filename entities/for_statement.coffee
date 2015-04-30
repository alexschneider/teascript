Type = require './type'
EntityUtils = require './entity_utilities'
VariableAssignment = require '../entities/variable_assignment'
IterableItem = require '../entities/iterable_item'
Block = require '../entities/block'
IntegerLiteral = require '../entities/integer_literal'
VariableReference = require '../entities/variable_reference'

class ForStatement
  constructor: (@id, @iterable, @body) ->

  toString: ->
    "(For #{@id.lexeme} #{@iterable} #{@body})"

  analyze: (context) ->
    localContext = context.createChildContext()

    localContext.addVariable @id.lexeme, @id

    @iterable.analyze localContext
    @body.analyze localContext

    @mustBeIterable()



  mustBeIterable: ->
    error = 'Object must be iterable'
    memberAccessTypes = [Type.LIST, Type.MAP, Type.SET, Type.STR, Type.TUPLE]
    @iterable.type.mustBeCompatibleWith memberAccessTypes,
                                                 error,
                                                 EntityUtils.findLocation @iterable

  optimize: ->
    iterations = @iterable.length()
    if iterations < 1
      return null 
    newBody = []
    for i in [0...iterations - 1]
      newIterable = new IterableItem @iterable, new IntegerLiteral {'lexeme': "#{i}", 'kind': 'INTLIT'}
      newId = new VariableReference @id
      newStatement = new VariableAssignment newId, newIterable
      newBody.push newStatement
      newBody.concat @body.statements
    new Block newBody

module.exports = ForStatement
