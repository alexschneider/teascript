class Trait
  constructor: (@expressions) ->

  toString: ->
    "(Trait #{@expressions.join(' ')})"

  analyze: (context) ->
    # TODO

  optimize: (context) ->
    # TODO

module.exports = Trait
