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
    newId = new VariableReference @id
    iterableReference = new VariableReference {'lexeme':'dummy', 'kind':'ID'}
    newId.referent = @id
    newBody = []
    newBody.push new VariableAssignment iterableReference, @iterable
    console.log @body
    for i in [0...iterations]
      newIntLit = new IntegerLiteral {'lexeme': "#{i}", 'kind': 'INTLIT'}
      newIterableItem = new IterableItem iterableReference, newIntLit
      newStatement = new VariableAssignment newId, newIterableItem
      newBody.push newStatement
      newBody = newBody.concat @body.statements.map((s) -> s.optimize()).filter((s) -> s?)
    new Block newBody

module.exports = ForStatement
