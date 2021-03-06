CustomError = require '../error/custom_error'

cache = {}

class Type

  constructor: (@name) ->
    cache[@name] = this

  @forName: (name) -> cache[name]

  @BOOL = new Type 'bool'
  @INT = new Type 'int'
  @FLOAT = new Type 'float'
  @NONE = new Type 'none'
  @STR = new Type 'str'
  @LIST = new Type 'list'
  @MAP = new Type 'map'
  @TUPLE = new Type 'tuple'
  @SET = new Type 'set'
  @FUNC = new Type 'func'
  @ARBITRARY = new Type '<arbitrary_type>'

  toString: -> @name

  mustBeNumeric: (message, location) ->
    @mustBeCompatibleWith [Type.INT, Type.FLOAT], message, location

  mustBeInteger: (message, location) ->
    @mustBeCompatibleWith [Type.INT], message, location

  mustBeBoolean: (message, location) ->
    @mustBeCompatibleWith [Type.BOOL], message, location

  mustBeString: (message, location) ->
    @mustBeCompatibleWith [Type.STR], message, location

  mustBeCompatibleWith: (otherTypes, message, location) ->
    # @ is passed to callback when invoked, for use as its this value
    unless otherTypes.some(@isCompatibleWith, @)
      throw new CustomError(message, location)

  mustBeMutuallyCompatibleWith: (otherType, message, location) ->
    if not (@isCompatibleWith otherType or otherType.isCompatibleWith(this))
      throw new CustomError message, location

  isCompatibleWith: (otherType) ->
    # In more sophisticated languages, comapatibility would be more complex
    return this is otherType or

           this is Type.ARBITRARY or
           otherType is Type.ARBITRARY

module.exports = Type
