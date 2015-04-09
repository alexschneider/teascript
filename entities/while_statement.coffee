EntityUtils = require './entity_utilities'

class WhileStatement
  constructor: (@condition, @body) ->

  toString: ->
    "(While #{@condition} #{@body})"

  analyze: (context) ->
    @condition.analyze context

    #TODO: possibly change this to allow for truthy/flasey vals?
    @condition.type.mustBeBoolean 'Condition in "while" statement
                                   must be boolean',
                                  EntityUtils.findLocation @condition

    @body.analyze context

  optimize: ->
    # TODO

module.exports = WhileStatement
