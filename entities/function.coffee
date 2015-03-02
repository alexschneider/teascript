class Function

  constructor: (@params, @body) ->

  toString: ->
    "(Func #{@params} #{@body})"

  analyze: (context) ->
    #TODO

  optimize: -> this

module.exports = Function