class Parameters

  constructor: (@params) ->

  toString: ->
    "(#{(param.lexeme for param in @params).join(', ')})"

  analyze: (context) ->
    #TODO

  optimize: -> this

module.exports = Parameters