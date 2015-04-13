class ReturnStatement

  constructor: (@value) ->

  toString: ->
    "(Return #{@value})"

  analyze: (context) ->
    @value.analyze context

  optimize: -> this

module.exports = ReturnStatement
