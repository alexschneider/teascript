Type = require './type'
EntityUtils = require './entity_utilities'

class ForStatement
  constructor: (@id, @iterable, @body) ->

  toString: ->
    "(For #{@id.lexeme} #{@iterable} #{@body})"

  analyze: (context) ->
    localContext = context.createChildContext()

    localContext.addVariable @id.lexeme, @id

    @iterable.analyze localContext
    @body.analyze localContext

    @mustBeIterable()



  mustBeIterable: ->
    error = 'Object must be iterable'
    memberAccessTypes = [Type.LIST, Type.MAP, Type.SET, Type.STR, Type.TUPLE]
    @iterable.type.mustBeCompatibleWith memberAccessTypes,
                                                 error,
                                                 EntityUtils.findLocation @iterable

  optimize: ->
    # TODO

module.exports = ForStatement
