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
      @mustBeFieldOfObject()

    else
      @field.analyze context
      @type = @field.type

  mustBeFieldOfObject: ->
    unless @object.type is Type.ARBITRARY or
           @object.type.classDef[@field]
      throw new CustomError "field #{@field} not defined in object #{@object}",
                            EntityUtils.findLocation @field
    else
      @type = @object.type?.classDef?[@field].type or Type.ARBITRARY


  mustBeObject: ->
    unless @object.type instanceof ClassType or
            @object.type is Type.ARBITRARY
      throw new CustomError "can only access fields of
                                 objects (found #{@object.type})",
                                 EntityUtils.findLocation @object

  mustBeStringID: ->
    error = 'field ID must be of type string'
    @field.type.mustBeString error, EntityUtils.findLocation @field

  optimize: ->
    #TODO

module.exports = FieldAccess
