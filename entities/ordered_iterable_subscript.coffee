Type = require './type'
EntityUtils = require './entity_utilities'

class OrderedIterableSubscript

  constructor: (@orderedIterable, @index) ->

  toString: ->
    "(Subscript #{@orderedIterable} #{@index})"

  analyze: (context) ->
    @orderedIterable.analyze context
    @index.analyze context

    @mustBeOrderedIterable()
    @mustHaveIntegerIdx()

    @type = Type.ARBITRARY

  mustBeOrderedIterable: ->
    error = 'must take subscript [] of an ordered iterable type'
    orderedIterableTypes = [Type.STR, Type.LIST, Type.TUPLE, Type.SET]
    @orderedIterable.type.mustBeCompatibleWith orderedIterableTypes,
                                               error,
                                               EntityUtils.findLocation @orderedIterable

  mustHaveIntegerIdx: ->
    error = 'index must be an integer'
    @index.type.mustBeInteger error, EntityUtils.findLocation @index

  optimize: ->
    #TODO


module.exports = OrderedIterableSubscript
