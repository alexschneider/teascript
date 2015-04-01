CustomError = require '../error/custom_error'

cache = {}

class Type

  constructor: (@name) ->
    cache[@name] = this

  @BOOL = new Type 'bool'
  @INT = new Type 'int'
  @FLOAT = new Type 'float'
  @NONE = new Type 'none'
  @STR = new Type 'str'
  @LIST = new Type 'list'
  @MAP = new Type 'map'
  @TUPLE = new Type 'tuple'
  @SET = new Type 'set'
  @ARBITRARY = new Type '<arbitrary_type>'

  toString: -> @name

  mustBeNumeric: (message, location) ->
    unless (this is Type.INT) or (this is Type.FLOAT)
      throw new CustomError message, location

  mustBeInteger: (message, location) ->
    @mustBeCompatibleWith Type.INT, message, location

  mustBeBoolean: (message, location) ->
    @mustBeCompatibleWith Type.BOOL, message, location

  mustBeCompatibleWith: (otherType, message, location) ->
    unless @isCompatibleWith(otherType)
      throw new CustomError(message, location)

  mustBeMutuallyCompatibleWith: (otherType, message, location) ->
    if not (@isCompatibleWith otherType or otherType.isCompatibleWith(this))
      throw new CustomError message, location

  isCompatibleWith: (otherType) ->
    # In more sophisticated languages, comapatibility would be more complex
    return this is otherType or

           this is Type.ARBITRARY or
           otherType is Type.ARBITRARY

module.exports =
  BOOL: Type.BOOL
  INT: Type.INT
  FLOAT: Type.FLOAT
  NONE: Type.NONE
  STR: Type.STR
  LIST: Type.LIST
  MAP: Type.MAP
  TUPLE: Type.TUPLE
  SET: Type.SET
  ARBITRARY: Type.ARBITRARY
  forName: (name) -> cache[name]