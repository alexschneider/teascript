Type = require './type'
EntityUtils = require './entity_utilities'
CustomError = require '../error/custom_error'
ClassType = require './class_type'
VariableReference = require './variable_reference'

class FieldAccess

  constructor: (@object, @field) ->

  toString: ->
    "(. #{@object} #{@field})"

  analyze: (context) ->
    @object.analyze context
    @mustBeObject()
    if @field instanceof VariableReference
      unless @object.type is Type.ARBITRARY or
             @object.type.classDef[@field]
        throw new CustomError "field #{@field} not defined in object #{@object}
                              (instance of class #{@object.type.name})",
                              EntityUtils.findLocation @field
        return
      else
        @type = @object?.type?.classDef?[@field].type or Type.ARBITRARY
    else
      @field.analyze context
      @type = @field.type


  mustBeObject: ->
    unless @object.type instanceof ClassType or
            @object.type is Type.ARBITRARY
      throw new CustomError "can only access fields of
                                 objects (found #{@object.type})",
                                 EntityUtils.findLocation @object
  getField: ->
    if @field instanceof VariableReference
      return @object.type.classDef[@field]
    else
      @field.analyze
      return true


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
