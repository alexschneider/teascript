class ReturnStatement

  constructor: (@value) ->

  toString: ->
    "(Return #{@value})"

  analyze: (context) ->
    #TODO

  optimize: -> this

module.exports = ReturnStatement
