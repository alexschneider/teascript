class Function

  constructor: (@params, @body) ->

  toString: ->
    "(#{@params} #{@body})"

  analyze: (context) ->
    #TODO

  optimize: -> this

module.exports = Function