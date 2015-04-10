Type = require './type'
EntityUtils = require './entity_utilities'

class MemberAccess

  constructor: (@object, @member) ->

  toString: ->
    "(. #{@object} #{@member})"

  analyze: (context) ->
    @object.analyze context
    @member.analyze context

    @mustBeMapObject()
    @mustBeStringID()
    @type = Type.ARBITRARY


  mustBeMapObject: ->
    error = 'object being accessed must be of type map literal'
    memberAccessTypes = [Type.MAP]
    @object.type.mustBeCompatibleWith memberAccessTypes,
                                                 error,
                                                 EntityUtils.findLocation @object
  mustBeStringID: ->
    error = 'member ID must be of type string'
    @member.type.mustBeString error, EntityUtils.findLocation @member

  optimize: ->
    #TODO

module.exports = MemberAccess
