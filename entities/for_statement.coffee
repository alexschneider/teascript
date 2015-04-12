Type = require './type'
EntityUtils = require './entity_utilities'

class ForStatement
  constructor: (@id, @iterable, @body) ->

  toString: ->
    "(For #{@id.lexeme} #{@iterable} #{@body})"

  analyze: (context) ->
    # TODO
    @iterable.analyze context
    @body.analyze context
    @mustBeIterable()



  mustBeIterable: ->
    error = 'Object must be iterable'
    memberAccessTypes = [Type.LIST, Type.MAP, Type.SET, Type.STR]
    @iterable.type.mustBeCompatibleWith memberAccessTypes,
                                                 error,
                                                 EntityUtils.findLocation @iterable

  optimize: ->
    # TODO

module.exports = ForStatement
