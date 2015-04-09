Type = require './type'

class Function

  constructor: (@params, @body) ->

  toString: ->
    "(Func #{@params} #{@body})"

  analyze: (context) ->
    localContext = context.createChildContext()
    @params.analyze localContext
    @body.analyze localContext
    @type = Type.FUNC

  optimize: ->
    #TODO

module.exports = Function