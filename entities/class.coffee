class Class
  constructor: (@expressions) ->

  toString: ->
    "(Class #{@expressions.join(' ')})"

  analyze: (context) ->
    # TODO

  optimize: (context) ->
    # TODO

module.exports = Class
