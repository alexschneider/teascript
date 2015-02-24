class Parameters

  constructor: (@params) ->
    console.log "constructing params"

  toString: ->
    "(#{@params.join(', ')})"

  analyze: (context) ->
    #TODO

  optimize: -> this

module.exports = Parameters