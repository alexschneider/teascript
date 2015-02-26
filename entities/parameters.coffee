class Parameters

  constructor: (@params) ->

  toString: ->
    "(#{@params.join(', ')})"

  analyze: (context) ->
    #TODO

  optimize: -> this

module.exports = Parameters