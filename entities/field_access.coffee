Type = require './type'
EntityUtils = require './entity_utilities'
CustomError = require '../error/custom_error'

class FieldAccess

  constructor: (@object, @field) ->

  toString: ->
    "(. #{@object} #{@field})"

  analyze: (context) ->
    @object.analyze context

    @mustBeObject()
    @fieldMustBeDefined()

    @type = @getField().type


  mustBeObject: ->
    # builtInTypes =
    # @object.field.name isnt builtInType for builtInType in builtInTypes
    # TODO: figure out how to check that this is an object

  getField: ->
    @object.type.type[@field]

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
