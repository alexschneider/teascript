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

  optimize: ->
    @condition = @condition.optimize()
    @body = @body.optimize()
    if not @body?
      return null
    this

module.exports = WhileStatement
