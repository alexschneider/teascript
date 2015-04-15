
Type = require './type'
EntityUtils = require './entity_utilities'
CustomError = require '../error/custom_error'
ClassType = require './class_type'

class FieldAccess

  constructor: (@object, @field) ->

  toString: ->
    "(. #{@object} #{@field})"

  analyze: (context) ->
    @object.analyze context
    @field.analyze context

    @mustBeObject()
    @fieldMustBeDefined()
    console.log "FUCKING TYPE #{@getField().type}"
    @type = @getField().type


  mustBeObject: ->
    unless @object.type instanceof ClassType
      throw new CustomError "can only access fields of
                                 objects (found #{@object.type})",
                                 EntityUtils.findLocation @object
  getField: ->
    fieldName = @getLexeme @field
    @object.type.classDef[fieldName]

  getLexeme: (field) ->
    for k, v of field
      return v.lexeme if v.lexeme?
      return @getLexeme v if typeof v is 'object'
    return null


  fieldMustBeDefined: ->
    error = "field #{@field} not defined in object #{@object}
             (instance of class #{@object.type.name})"
    location = EntityUtils.findLocation @field
    throw new CustomError error, location unless @getField()?

  mustBeStringID: ->
    error = 'field ID must be of type string'
    @field.type.mustBeString error, EntityUtils.findLocation @field

  optimize: ->
    #TODO

module.exports = FieldAccess
