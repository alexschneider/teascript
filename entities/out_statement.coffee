class OutStatement

  constructor: (@value) ->

  toString: ->
    "(Out #{@value})"

  analyze: (context) ->
    @value.analyze context

  optimize: -> this

module.exports = OutStatement
