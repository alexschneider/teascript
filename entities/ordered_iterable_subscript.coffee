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
    error = 'must take subscript [] of an ordered iterable type'
    orderedIterableTypes = [Type.STR, Type.LIST, Type.TUPLE]
    @orderedIterable.type.mustBeCompatibleWith orderedIterableTypes,
                                               error
                                               @orderedIterable.lineNumber

  indexMustBeInteger: ->
    error = 'index must be an integer'
    @index.mustBeInteger error, @index.lineNumber

module.exports = OrderedIterableSubscript
