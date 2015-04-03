class WhileStatement
  constructor: (@condition, @body) ->

  toString: ->
    "(While #{@condition} #{@body})"

  analyze: (context) ->
    location = @findLocation JSON.parse(JSON.stringify(@condition))
    @condition.analyze context
    #TODO: possibly change this to allow for truthy/flasy vals?
    @condition.type.mustBeBoolean 'Condition in "while" statement
                                   must be boolean',
                                  location
    @body.analyze context

  optimize: ->
    # TODO

  # TODO: consider passing the line number as an argument so
  # that you don't have to traverse the structure to find it
  # If not, be sure to pull this out into a separate file as
  # a utility function
  findLocation: (parsedToken) ->
    for k, v of parsedToken
      if typeof(v) is 'object'
        return @findLocation v
      else if k is 'lineNumber'
        return v

module.exports = WhileStatement
