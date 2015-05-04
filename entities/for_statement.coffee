Type = require './type'
EntityUtils = require './entity_utilities'
VariableAssignment = require '../entities/variable_assignment'
IterableItem = require '../entities/iterable_item'
Block = require '../entities/block'
IntegerLiteral = require '../entities/integer_literal'
VariableReference = require '../entities/variable_reference'
Generator = require '../generators/jsgenerator'

class ForStatement
  constructor: (@id, @iterable, @body, @unrollFactor = 500) ->

  toString: ->
    "(For #{@id.lexeme} #{@iterable} #{@body})"

  analyze: (context) ->
    localContext = context.createChildContext()

    localContext.addVariable @id.lexeme, @id

    @iterable.analyze localContext
    @body.analyze localContext

    @mustBeIterable()

  isLeafForStatement: () ->
    not @.hasStatement('ForStatement')

  hasStatement: (statement) ->
    statementFound = false
    blocks = ['Block',
              'ConditionalExpression',
              'ForStatement',
              'FunctionExpression',
              'WhileStatement']
    for s in @body.statements
      name = s.constructor.name
      statementFound = switch
        when name is statement then true
        when name in blocks then s.hasStatement(statement)
        else false
      return true if statementFound
    return false

  mustBeIterable: ->
    error = 'Object must be iterable'
    memberAccessTypes = [Type.LIST, Type.MAP, Type.SET, Type.STR, Type.TUPLE]
    @iterable.type.mustBeCompatibleWith memberAccessTypes,
                                                 error,
                                                 EntityUtils.findLocation @iterable

  optimize: ->
    unless @isLeafForStatement()
      @body.statements = @body.statements.map((s) -> s.optimize()).filter((s) -> s?)
      return this

    iterations = @iterable.length()

    # TODO Put unrolled loop in another loop if
    # loop is too big, ie more than 500 iterations.
    newId = new VariableReference @id
    newId.referent = @id

    iterableReference = new VariableReference @iterable
    iterableReference.referent = iterableReference

    newBody = []
    newBody.push new VariableAssignment iterableReference, @iterable

    for i in [0...iterations]
      newIntLit = new IntegerLiteral {'lexeme': "#{i}", 'kind': 'INTLIT'}
      newIterableItem = new IterableItem iterableReference, newIntLit
      newStatement = new VariableAssignment newId, newIterableItem
      newBody.push newStatement
      newBody = newBody.concat @body.statements.map((s) -> s.optimize()).filter((s) -> s?)
    new Block newBody

module.exports = ForStatement
