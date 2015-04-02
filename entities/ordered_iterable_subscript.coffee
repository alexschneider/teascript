Type = require './type'

class OrderedIterableSubscript

  constructor: (@orderedIterable, @index) ->

  toString: ->
    "(Subscript #{@orderedIterable} #{@index})"

  analyze: (context) ->
    @orderedIterable.analyze context
    @index.analyze context

    @mustBeOrderedIterable()
    @indexMustBeInteger()
    @type = Type.arbitrary

  optimize: ->
    #TODO

  mustBeOrderedIterable: ->
    location = @findLocation JSON.parse(JSON.stringify(@orderedIterable))
    error = 'must take subscript [] of an ordered iterable type'
    orderedIterableTypes = [Type.STR, Type.LIST, Type.TUPLE, Type.SET]
    @orderedIterable.type.mustBeCompatibleWith orderedIterableTypes,
                                               error
                                               location

  indexMustBeInteger: ->
    location = @findLocation JSON.parse(JSON.stringify(@index))
    error = 'index must be an integer'
    @index.type.mustBeInteger error, location

  # TODO: DEAL WITH THIS BETTER
  findLocation: (parsedToken) ->
    for k, v of parsedToken
      if typeof(v) is 'object'
        return @findLocation v
      else if k is 'lineNumber'
        return v


module.exports = OrderedIterableSubscript
