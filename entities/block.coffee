class Block
  constructor: (@statements) ->

  toString: ->
    "(Block #{@statements.join(' ')})"

  analyze: (context) ->
    # TODO

  optimize: ->
    # TODO

module.exports = Block