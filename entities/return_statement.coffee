class ReturnStatement

  constructor: (@value) ->
    console.log "constructing with #{@value}"

  toString: ->
    "(Return #{@value})"

  analyze: (context) ->
    #TODO

  optimize: -> this

module.exports = ReturnStatement
