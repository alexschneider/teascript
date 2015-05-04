EntityUtils = require './entity_utilities'

class WhileStatement
  constructor: (@condition, @body) ->

  toString: ->
    "(While #{@condition} #{@body})"

  analyze: (context) ->
    @condition.analyze context

    #TODO: possibly change this to allow for truthy/flasy vals?
    @condition.type.mustBeBoolean 'Condition in "while" statement
                                   must be boolean',
                                  EntityUtils.findLocation @condition

    @body.analyze context

  hasStatement: (statement) ->
    statementFound = false
    blocks = ['Block', 'ConditionalExpression', 'ForStatement', 'WhileStatement']
    for s in @body
      name = s.constructor.name
      statementFound = switch
        when name is statement then true
        when name in blocks then s.hasStatement(statement)
        else false
      return true if statementFound
    return false

  optimize: ->
    # TODO

module.exports = WhileStatement
