class Block
  constructor: (@statements) ->

  toString: ->
    "(Block #{@statements.join(' ')})"

  analyze: (context) ->
    localContext = context.createChildContext()
    statement.analyze(localContext) for statement in @statements

  optimize: ->
    # TODO

module.exports = Block
