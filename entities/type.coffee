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

  mustBeInteger: (message, location) ->
    @mustBeCompatibleWith Type.INT, message

  mustBeBoolean: (message, location) ->
    @mustBeCompatibleWith Type.BOOL, message

  mustBeCompatibleWith: (otherType, message, location) ->
    throw new CustomError(message, location.lineNumber) if not @isCompatibleWith(otherType)

  mustBeMutuallyCompatibleWith: (otherType, message, location) ->
    if not (@isCompatibleWith otherType or otherType.isCompatibleWith(this))
      throw new CustomError message, location.lineNumber

  isCompatibleWith: (otherType) ->
    # In more sophisticated languages, comapatibility would be more complex
    return this is otherType or

           this is Type.ARBITRARY or
           otherType is Type.ARBITRARY or

           ((this is Type.INT and otherType is Type.FLOAT) or
            (this is Type.FLOAT and otherType is Type.INT))

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