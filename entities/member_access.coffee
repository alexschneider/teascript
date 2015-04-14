Type = require './type'
EntityUtils = require './entity_utilities'

class MemberAccess

  constructor: (@object, @member) ->

  toString: ->
    "(. #{@object} #{@member})"

  analyze: (context) ->
    @object.analyze context
    @member.analyze context

    @mustBeObject()
    # @type = Type.ARBITRARY


  mustBeObject: ->
    console.log @object.type

  mustBeStringID: ->
    error = 'member ID must be of type string'
    @member.type.mustBeString error, EntityUtils.findLocation @member

  optimize: ->
    #TODO

module.exports = MemberAccess
