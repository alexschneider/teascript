flat = require 'flat'

class WhileStatement
  constructor: (@condition, @body) ->

  toString: ->
    "(While #{@condition} #{@body})"

  analyze: (context) ->
    location = @findLocation JSON.parse(JSON.stringify(@condition))
    @condition.analyze context
    @condition.type.mustBeBoolean 'Condition in "while" statement must be boolean',
                                  location
    @body.analyze context

  optimize: ->
    # TODO

  findLocation: (parsedToken) ->
    for k, v of parsedToken
      if typeof(v) is 'object'
        return @findLocation v
      else if k is 'lineNumber'
        return v

module.exports = WhileStatement
