Type = require './type'
EntityUtils = require './entity_utilities'
CustomError = require '../error/custom_error'

class IterableItem

  constructor: (@iterable, @itemFinder) ->

  toString: ->
    "(GetItem #{@iterable} #{@itemFinder})"

  analyze: (context) ->
    @iterable.analyze context
    @itemFinder.analyze context

    if @isOrderedIterable @iterable
      @mustHaveIntegerIdx()
    else if @isMap @iterable
      @mustHaveIntOrStrKey()
    else
      throw new CustomError "cannot [] get item of a #{@iterable.type}
                             (not iterable)",
                            EntityUtils.findLocation @iterable

    @type = Type.ARBITRARY

  isOrderedIterable: (entity) ->
    [Type.STR, Type.LIST, Type.TUPLE, Type.SET]
      .some entity.type.isCompatibleWith, entity.type

  isMap: (entity) ->
    entity.type.isCompatibleWith Type.MAP

  mustHaveIntegerIdx: ->
    idx = @itemFinder
    error = "#{@iterable.type.toString()} indices must be integers,
             not #{idx.type.toString()}"
    idx.type.mustBeInteger error, EntityUtils.findLocation idx

  mustHaveIntOrStrKey: ->
    key = @itemFinder
    error = "key of #{@iterable} must be string or float"
    key.type.mustBeCompatibleWith [Type.STR, Type.INT],
                                  error,
                                  EntityUtils.findLocation key

  optimize: ->
    #TODO

  expression: true


module.exports = IterableItem
