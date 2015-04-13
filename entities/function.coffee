Type = require './type'

class Function

  constructor: (@params, @body) ->

  toString: ->
    "(Func #{@params} #{@body})"

  analyze: (context) ->
    @type = Type.FUNC
    localContext = context.createChildContext()
    @params.analyze localContext
    @body.analyze localContext

  optimize: ->
    #TODO

module.exports = Function